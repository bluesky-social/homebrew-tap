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
      url "https://github.com/bluesky-social/diderot/releases/download/v1.0.0/diderot_1.0.0_darwin_arm64.tar.gz"
      sha256 "156d4a1bbd8bcff74ea45d7e197aaec9522461b92468a270b383ff44848253f7"
    end
    on_intel do
      url "https://github.com/bluesky-social/diderot/releases/download/v1.0.0/diderot_1.0.0_darwin_amd64.tar.gz"
      sha256 "d81c3e13c45006b5876818643cd6caf55a64eb473b4fa576bd0a82efdb37aeb0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bluesky-social/diderot/releases/download/v1.0.0/diderot_1.0.0_linux_arm64.tar.gz"
      sha256 "a5c2febe82d457f6cb9522197e7c404697cd4090b00a1b8fd3b7fd7c78ac769d"
    end
    on_intel do
      url "https://github.com/bluesky-social/diderot/releases/download/v1.0.0/diderot_1.0.0_linux_amd64.tar.gz"
      sha256 "389dd42c3e942e7b00cf095420a7053f55365bac24173424faf485019b1a4fc1"
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
