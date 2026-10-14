# This file is generated from the public PCR release artifacts. Do not edit.
cask "pcr" do
  version "0.1.4"

  on_macos do
    on_arm do
      sha256 "4927270a41afdb229892e0502ebae85f234ad59ce41485cd62bdf688ac94a6ce"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "089fa5c0ae3e29d4e378ab246b08483dcbad060cb5c44713528a99511f4b45ac"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "6d0bf04e25af5d38b88a26d93cd6a425a19bfb838cf80e61033264c14d0f5541"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "64c3600abcbd28d52746435b55f53f77cf965afe1e0afdeeaa283e5eed866a51"
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
