cask "valet" do
  version "1.0.10"
  sha256 "43b97d7718f084f18b9578c1356c59f8d0916deb523caee1436be97d51a33a5e"

  url "https://github.com/valetdotdev/homebrew-tap/releases/download/v#{version}/Valet-#{version}-arm64.dmg"
  name "Valet"
  desc "MCP server and skill deployment and collaboration platform"
  homepage "https://valet.dev"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Valet.app"

  zap trash: [
    "~/Library/Application Support/dev.valet.desktop",
    "~/Library/Caches/dev.valet.desktop",
    "~/Library/Preferences/dev.valet.desktop.plist",
  ]
end
