class ValetCli < Formula
  desc "Valet runs your agents"
  homepage "https://valet.dev"
  version "0.1.1"

  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/valetdotdev/homebrew-tap/releases/download/valet-cli-v#{version}/valet-cli-#{version}-darwin-arm64.tar.gz"
      sha256 "d270987ffb8ab4b49978dc897df1021d47cda1a3a603d1b226379e15202dac9e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/valetdotdev/homebrew-tap/releases/download/valet-cli-v#{version}/valet-cli-#{version}-linux-arm64.tar.gz"
      sha256 "6b18bdeb5702111e4c50fddfd49146a8f18d48fa9ef6f1cd5c24216a7659c8d9"
    else
      url "https://github.com/valetdotdev/homebrew-tap/releases/download/valet-cli-v#{version}/valet-cli-#{version}-linux-x64.tar.gz"
      sha256 "49367fba4c91e0c3e950fd16f37af143c4c53c3c599dd4750ab4c8f0414d9896"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/valet"
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/valet --version")
  end
end
