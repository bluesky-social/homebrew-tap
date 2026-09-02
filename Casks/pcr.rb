# This file is generated from the public PCR release artifacts. Do not edit.
cask "pcr" do
  version "0.1.0"

  on_macos do
    on_arm do
      sha256 "fc5e0a51eb911429e0dd183dd635c32ba331c44cceed63d61f00b9a3c1ba0c26"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "fee56fd93a8dd74847973ee788987d2f4b8ee6cc59ac7d591bbe0140fa39b584"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "6ea18c33aa3a0bc1be9e6f888094ec3b646081643caa317c227cc46506793124"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "b3b337ed813292c80ebbdb44965400027a56caa41ecf482d66ec2a16b14578e2"
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
