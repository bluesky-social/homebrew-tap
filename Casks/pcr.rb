# This file is generated from the public PCR release artifacts. Do not edit.
cask "pcr" do
  version "0.1.7"

  on_macos do
    on_arm do
      sha256 "8973ffdc9497dff9ffb7aa2438f0ee3d6328ebd79471dabae882576fd9d516e7"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "45c96b03945d2b81126c66c83d9bddf76e92227769c9a4cc868dbbc38ae262e4"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "81bc103c19203b152fbf2d6b72f27835a8ee4225aec5ea45ab63528b5d5300fb"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "f7fadbc113d0e3cb5424123f6d28078503c178d61eaf5f88732b55b6895ac1df"
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
