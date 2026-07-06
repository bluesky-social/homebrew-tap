# Download strategy for release assets in private GitHub repos, using the
# GitHub CLI (`gh`) for authentication. Chosen over the widely documented
# HOMEBREW_GITHUB_API_TOKEN approach because (a) engineers already have gh
# authenticated (the CLI telemetry config-fetch requires it), so this adds
# zero credential provisioning, and (b) Homebrew 5.1.14 began scrubbing
# sensitive env vars during formula eval, which the token approach depends on.
#
# Formulas use it via:
#
#   url "https://github.com/<org>/<repo>/releases/download/v1.2.3/tool_1.2.3_darwin_arm64.tar.gz",
#       using: GhPrivateReleaseStrategy
#
# The URL is parsed for owner/repo/tag/asset; the actual fetch shells out to
# `gh release download`, which resolves auth from gh's keychain state.
class GhPrivateReleaseStrategy < CurlDownloadStrategy
  def initialize(url, name, version, **meta)
    super
    parse_url_pattern
  end

  def parse_url_pattern
    unless %r{^https://github\.com/([^/]+)/([^/]+)/releases/download/([^/]+)/(.+)$} =~ @url
      raise CurlDownloadStrategyError, "Invalid release-asset URL pattern: #{@url}"
    end

    @owner = Regexp.last_match(1)
    @repo = Regexp.last_match(2)
    @tag = Regexp.last_match(3)
    @filename = Regexp.last_match(4)
  end

  private

  # Homebrew sanitizes PATH during fetch, so `which` cannot see
  # /opt/homebrew/bin even when gh is installed. Probe known install
  # locations directly. Note `depends_on "gh"` does NOT guarantee gh at
  # fetch time either — brew fetches all downloads before installing any
  # dependency — so gh must be preinstalled (README step 1).
  def find_gh
    candidates = [
      "#{HOMEBREW_PREFIX}/bin/gh",
      "/opt/homebrew/bin/gh",
      "/usr/local/bin/gh",
    ]
    found = candidates.find { |p| File.executable?(p) }
    found || which("gh")&.to_s
  end

  def _fetch(url:, resolved_url:, timeout:)
    gh = find_gh
    unless gh
      raise CurlDownloadStrategyError, <<~EOS
        The GitHub CLI (gh) is required to download #{@owner}/#{@repo} release
        assets, and must be installed BEFORE this formula (brew fetches
        downloads before installing dependencies). Run:
          brew install gh && gh auth login
      EOS
    end

    unless quiet_system(gh, "auth", "status", "--hostname", "github.com")
      raise CurlDownloadStrategyError, <<~EOS
        gh is not authenticated to github.com, so the private release asset
        cannot be downloaded. Run: gh auth login
      EOS
    end

    ok = system(gh, "release", "download", @tag,
                "--repo", "#{@owner}/#{@repo}",
                "--pattern", @filename,
                "--output", temporary_path.to_s,
                "--clobber")
    return if ok && temporary_path.exist? && !temporary_path.empty?

    raise CurlDownloadStrategyError, <<~EOS
      gh failed to download #{@filename} from #{@owner}/#{@repo}@#{@tag}.
      Check that your GitHub account has access to the repo:
        gh release view #{@tag} --repo #{@owner}/#{@repo}
    EOS
  end
end
