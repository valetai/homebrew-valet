cask "valet" do
  version "1.0.4"
  sha256 "71cc7e244108a5568c59063605fc0d2248f294f0116fefa1870719815ca087ec"

  url "https://github.com/valetdotdev/homebrew-tap/releases/download/v#{version}/Valet-#{version}-arm64.dmg"
  name "Valet"
  desc "AI assistant for developers"
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
