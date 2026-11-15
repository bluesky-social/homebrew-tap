# This file is generated from the public PCR release artifacts. Do not edit.
cask "pcr" do
  version "0.2.0"

  on_macos do
    on_arm do
      sha256 "95962a54920e19ed5605e3ad51b253926f2ebe640b467bd7a19c89ff56099953"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "20b31a8e49c180dadcd423ff75681ac5e34c760fb1469629a4ebc5a63eadacab"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "8fc6f7f1884c388e0f97e7c891b317c3e8f5ca31f3b81a1fcf6ec5bb18d7b21e"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "20ebfc648239b4065b36234e756d7c94140ddfcce009d6c9cac1e31eb89dd273"
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
