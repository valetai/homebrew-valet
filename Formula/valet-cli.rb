class ValetCli < Formula
  desc "Valet runs your agents"
  homepage "https://valet.dev"
  version "0.1.4"

  depends_on "node"

  on_macos do
    depends_on "container"
    if Hardware::CPU.arm?
      url "https://github.com/valetdotdev/homebrew-tap/releases/download/valet-cli-v#{version}/valet-cli-#{version}-darwin-arm64.tar.gz"
      sha256 "2efce175c7cf2e10118b4d1592bedc85480c1f627f4061aa4cca28c96754d469"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/valetdotdev/homebrew-tap/releases/download/valet-cli-v#{version}/valet-cli-#{version}-linux-arm64.tar.gz"
      sha256 "62dc9082b46d2b756f0be737abca11b17ac4827c0cae761ffcbf2d8995d49a90"
    else
      url "https://github.com/valetdotdev/homebrew-tap/releases/download/valet-cli-v#{version}/valet-cli-#{version}-linux-x64.tar.gz"
      sha256 "2e5f09b99d648d613ff2d07f09b933ebd35c3f40105bef8a9a04be09a5ab2b52"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/valet"
  end

  def caveats
    <<~EOS
      To get started, run:
        valet onboard
    EOS
  end

  test do
    assert_match "0.1.4", shell_output("#{bin}/valet --version")
  end
end
