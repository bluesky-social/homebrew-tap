# This file is generated from the public PCR release artifacts. Do not edit.
cask "pcr" do
  version "0.3.0"

  on_macos do
    on_arm do
      sha256 "5040e61b4cf15feae5c4608ac794148176d22f01a19def164a73e2c2a65d2909"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "db10bf988667a22258a58c34b2511a4cedae94025b1b7cd979a6c78231ca7a4a"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "6dda4891f26dc4abe30c10a3b7b1e6a5511b3a0906ff37d189db9616275bdb51"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "61a47bf5051bf32bfd07b2db147458f8b08c906689f87c6755481aa88a7cd3c8"
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
