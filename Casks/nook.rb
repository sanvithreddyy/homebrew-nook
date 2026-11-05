cask "nook" do
  version "0.1.9"
  sha256 "febe8b0877777dc52ad5a63e4e3890429ff7be7f0d7ffb32baeb1b645f85011b"

  url "https://github.com/sanvithreddyy/nook/releases/download/v#{version}/Nook-#{version}.dmg"
  name "Nook"
  desc "Live island in the notch for music, meetings, timers and files"
  homepage "https://github.com/sanvithreddyy/nook"

  # From 0.1.2 Nook updates itself, through Settings.
  auto_updates true
  depends_on macos: :sequoia

  app "Nook.app"

  # Not notarized: clear the download quarantine so it opens without Open Anyway.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Nook.app"],
        writable_paths: ["{{appdir}}/Nook.app"]
  end

  uninstall quit: "com.sanvith.nook"

  zap trash: [
    "~/Library/Application Support/Nook",
    "~/Library/Caches/com.sanvith.nook",
    "~/Library/HTTPStorages/com.sanvith.nook",
    "~/Library/Preferences/com.sanvith.nook.plist",
    "~/Library/Preferences/com.sanvith.nook.timer.plist",
  ]
end
