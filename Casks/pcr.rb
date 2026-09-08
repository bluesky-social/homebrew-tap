# This file is generated from the public PCR release artifacts. Do not edit.
cask "pcr" do
  version "0.1.2"

  on_macos do
    on_arm do
      sha256 "531946eca04079c6efaebab27d533d0d15bf9a225dd401395278978a85bb04e0"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "8cfc20e1c06e62729c8c0886023a7eadcb68fe13ec398806cba1b84f468e5d18"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "f647ddc082976960ff5a98f444aaf5e24681bf3651245a97bb731947269ed2f8"
      url "https://github.com/bluesky-social/pcr/releases/download/v#{version}/pcr_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "9f31642dd764a79e3bc0fb3e4a703f39c818ac2cfaef8f7c6c42162791bbbd00"
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
