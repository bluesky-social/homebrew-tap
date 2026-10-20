# This file is generated from the public PCR release artifacts. Do not edit.
cask "pcr" do
  version "0.1.6"

  on_macos do
    on_arm do
      sha256 "9bd6d395f94a573ea0efdb55b6394a4b24b4bedf382a38a75201873d70f3fbc5"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "d837955a5116fa4bd7262a2bbda27752d89313b8480a1b130ff2fb4b49f83a2d"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "d49bef447eb35822c72fd66b9ed27a047b276b58fc84792d777ade946e1a1cb2"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "3d7ee5cafb475f9fa02fea232183ead962d9efd4d5cc7736ce9a59304875b66f"
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
