cask "audioslim" do
  version "0.2.0"
  sha256 "a512f25324d60ce26007bdb8b0ef6232819a97d360078a0ed6124772fa67e3fe"

  url "https://github.com/gianpaj/audioslim/releases/download/#{version}/stable-macos-arm64-audioslim.dmg"
  name "AudioSlim"
  desc "Compress audio files using FFmpeg"
  homepage "https://github.com/gianpaj/audioslim"

  depends_on arch: :arm64

  app "audioslim.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/audioslim.app"]
  end

  zap trash: [
    "~/Library/Application Support/audioslim",
    "~/Library/Preferences/it.gianpaolo.audioslim.*",
  ]
end
