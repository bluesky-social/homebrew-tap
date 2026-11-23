# Written by bluesky-social/diderot's release workflow (scripts/homebrew-formula.sh). Do not edit.
class Diderot < Formula
  desc "Ask a Diderot server, and set up coding agents to use it"
  homepage "https://github.com/bluesky-social/diderot"
  license any_of: ["MIT", "Apache-2.0"]

  livecheck do
    skip "Each release publishes this formula"
  end

  on_macos do
    on_arm do
      url "https://github.com/bluesky-social/diderot/releases/download/v1.1.0/diderot_1.1.0_darwin_arm64.tar.gz"
      sha256 "1e3df507238821d3c36dde0bf0b03390fd1e0dd7d535d43cc3c7e0c0c17c304d"
    end
    on_intel do
      url "https://github.com/bluesky-social/diderot/releases/download/v1.1.0/diderot_1.1.0_darwin_amd64.tar.gz"
      sha256 "786e04ea977e0013625c6370ee87222861fb0a54ad0f9a51bb1cdcadbe8a0ec9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bluesky-social/diderot/releases/download/v1.1.0/diderot_1.1.0_linux_arm64.tar.gz"
      sha256 "f2e9f06f460001df54db3e4c125516436f7271ec1557035b8bc1407ab0923c79"
    end
    on_intel do
      url "https://github.com/bluesky-social/diderot/releases/download/v1.1.0/diderot_1.1.0_linux_amd64.tar.gz"
      sha256 "16db63c61ab662a263bf2b548487b46bf58687f1177f5737693bf97db9a83ef4"
    end
  end

  def install
    bin.install "diderot"
    # Homebrew installs README.md and the LICENSE-* files itself.
    doc.install "third-party"
  end

  def caveats
    <<~EOS
      To sign in to your Diderot server and set up your coding agents:
        diderot setup <server URL>
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/diderot --version")
  end
end
