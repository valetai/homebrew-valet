cask "valet" do
  version "1.0.6"
  sha256 "3ffe5b0c4bb743ee396e49fd4c356c54483086408539fba4a95cf4af3d72e709"

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
