cask "valet" do
  version "1.0.17"
  sha256 "f8e194c436e1599eff2b0ee04a8472cb0f60679da140efcce41c688c46f5c3b1"

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
