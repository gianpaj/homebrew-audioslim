cask "audioslim" do
  version "0.2.0"
  sha256 "d98fe3e5ffb825953299c4f8b9bfd758d5114c5cce5ad95b054c0c70e8c8d124"

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
