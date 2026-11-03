cask "nook" do
  version "0.1.6"
  sha256 "f30b470212c512c9219e217cccbab9db0b3ad80f230e9b7abfa439ed0ad766bb"

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
