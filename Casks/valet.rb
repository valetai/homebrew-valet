cask "valet" do
  version "1.0.5"
  sha256 "a2557fadbd1a2de7fa3107bcad3165aeb583673a623de0261a424a3f1409e38b"

  url "https://github.com/valetai/homebrew-tap/releases/download/v#{version}/Valet-#{version}-arm64.dmg"
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
