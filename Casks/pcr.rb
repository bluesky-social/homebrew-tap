# This file is generated from the public PCR release artifacts. Do not edit.
cask "pcr" do
  version "0.1.5"

  on_macos do
    on_arm do
      sha256 "1c9cb9bfbc0ad2f432dadb1007cb9071998282c95ead0c5c90d0e10dfced829d"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "891d9cf158fbd757e4cb84db71d9a43dca03b2cafd7d242f57d59414817e7a3e"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "17c45e52615f1c88d55e7a762f685bf9fab7cee7254db5619b7c6eafaba42079"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "3bf96c2d9f55e2085deafe42b1e5fffb5f79301b8c32bd2e359b1dd8e7eb4f6b"
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
