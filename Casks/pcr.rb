# This file is generated from the public PCR release artifacts. Do not edit.
cask "pcr" do
  version "0.1.3"

  on_macos do
    on_arm do
      sha256 "9699c3eaad4e8ef55af156e2d4fd1dfa421ff9b2507245fe1de9e0771dbb11a6"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "b5eecdaf5bda0583483bb0651d58d229a1d3b59743f536130833dac94761d0e6"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "ee08b05da64d66ea015f5e5345796d072b1a6f4792af9cfd500c566fcb426eed"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "2bd985407f64ebd976f3af5f0b44e2b0d2b0e5b8570f1d0fc0db4a9e09d8b010"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_linux_amd64.tar.gz"
    end
  end

  name "pcr"
  desc "CLI for the production change registry"
  homepage "https://github.com/bluesky-social/pcr"

  livecheck do
    skip "Updated from PCR releases."
  end

  binary "pcr"

  # Homebrew 7.0 deprecated postflight (goreleaser/goreleaser#6873);
  # emit the declarative postflight_steps stanza instead.
  postflight_steps do
    on_macos do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}/pcr"]
    end
  end
end
