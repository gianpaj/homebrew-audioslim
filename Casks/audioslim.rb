cask "audioslim" do
  version "0.2.0"
  sha256 "edf86e96697a70719879d141193118dfaee15a6c50d70abbcae67da36612031a"

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
