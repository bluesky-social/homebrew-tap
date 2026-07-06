# NOTE: hand-written for the phase-1 proof; once platform's goreleaser
# brews block lands (phase 2), this file is overwritten on every release
# and must not be hand-edited.
require_relative "../lib/gh_private_release_strategy"

class Lnx < Formula
  desc "Linear CLI: issues, projects, comments from the terminal"
  homepage "https://github.com/bluesky-social/platform"
  version "0.2.2"

  # No depends_on "gh": brew fetches downloads BEFORE installing deps, so a
  # gh dependency can't satisfy the download strategy anyway — the strategy
  # raises its own actionable "install gh first" error at fetch time. Leaving
  # it out also avoids coupling installs to gh's upgrade cadence.

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bluesky-social/platform/releases/download/v0.2.2/lnx_0.2.2_darwin_arm64.tar.gz",
          using: GhPrivateReleaseStrategy
      sha256 "33f825361b4228daf04e687390f97703e32433becf01c08ee4ff5b70c5b95c8d"
    else
      url "https://github.com/bluesky-social/platform/releases/download/v0.2.2/lnx_0.2.2_darwin_amd64.tar.gz",
          using: GhPrivateReleaseStrategy
      sha256 "4ee86af0c8e109737a9c5cfc68750afebfb3df300c1b5deb18627eab9b8ac2ea"
    end
  end

  def install
    bin.install "lnx"
  end

  test do
    assert_match "lnx version", shell_output("#{bin}/lnx --version")
  end
end
