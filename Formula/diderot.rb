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
      url "https://github.com/bluesky-social/diderot/releases/download/v1.2.0/diderot_1.2.0_darwin_arm64.tar.gz"
      sha256 "f5f4d8cb0f9b2f3d60459a5a70d9c82769d4dbca343523b4c9350d95f86e9391"
    end
    on_intel do
      url "https://github.com/bluesky-social/diderot/releases/download/v1.2.0/diderot_1.2.0_darwin_amd64.tar.gz"
      sha256 "4714a10f12bea6f58211a74f8f60d47e7d950fb0fa4b89e83e1de7b3ddd3f04c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bluesky-social/diderot/releases/download/v1.2.0/diderot_1.2.0_linux_arm64.tar.gz"
      sha256 "1aca693a353053344bdb4243728946fe4a0c904fc863fd00124f83384332ef47"
    end
    on_intel do
      url "https://github.com/bluesky-social/diderot/releases/download/v1.2.0/diderot_1.2.0_linux_amd64.tar.gz"
      sha256 "56bc59f1b725cbc9d84d7059ab77a536f9d50764f207a0723b426cab7915f6ed"
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
