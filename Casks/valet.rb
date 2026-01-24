cask "valet" do
  version "1.0.15"
  sha256 "39bd862176da6a5b3e4d41ad67360f906f7bd2f43f1a33f757f35fbc44838a1d"

  url "https://github.com/valetdotdev/homebrew-tap/releases/download/v#{version}/Valet-#{version}-arm64.dmg"
  name "Valet"
  desc "MCP server and skill deployment and collaboration platform"
  homepage "https://valet.dev"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "Valet.app"

  zap trash: [
    "~/Library/Application Support/dev.valet.desktop",
    "~/Library/Caches/dev.valet.desktop",
    "~/Library/Preferences/dev.valet.desktop.plist",
  ]
end
