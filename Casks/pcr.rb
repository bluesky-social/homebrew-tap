# This file is generated from the public PCR release artifacts. Do not edit.
cask "pcr" do
  version "0.1.1"

  on_macos do
    on_arm do
      sha256 "b123d7141e7beb31dc90b41590270b223a3ccf144a3d614592f6f0075fe4c2e0"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "fdf6ed01d2d7c7dbb1d1c81774130de9453a2e2fccedb3f4b94ee477c48ddc3c"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "732e151e90b2e941ab0bbc786ab64b1a9a6bd0d33da92d3fe7227086365680c1"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "35a2fd536aae7461ca641a8e18db033ec9dbbbcfc581bd3c6c919ac3fec76875"
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

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path.to_s] if OS.mac?
  end
end
