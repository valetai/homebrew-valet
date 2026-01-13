cask "valet" do
  version "0.0.0"
  sha256 "PLACEHOLDER"

  url "https://github.com/valetai/homebrew-valet/releases/download/v#{version}/Valet-#{version}-arm64.dmg"
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
