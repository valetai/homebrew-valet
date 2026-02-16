class ValetCli < Formula
  desc "Valet runs your agents"
  homepage "https://valet.dev"
  version "0.1.6"

  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/valetdotdev/homebrew-tap/releases/download/valet-cli-v#{version}/valet-cli-#{version}-darwin-arm64.tar.gz"
      sha256 "f3588a8a636cc1d5fa74d4e1b8e57ea7b315f75046d3a540be415410b43cfdcc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/valetdotdev/homebrew-tap/releases/download/valet-cli-v#{version}/valet-cli-#{version}-linux-arm64.tar.gz"
      sha256 "f3588a8a636cc1d5fa74d4e1b8e57ea7b315f75046d3a540be415410b43cfdcc"
    else
      url "https://github.com/valetdotdev/homebrew-tap/releases/download/valet-cli-v#{version}/valet-cli-#{version}-linux-x64.tar.gz"
      sha256 "f3588a8a636cc1d5fa74d4e1b8e57ea7b315f75046d3a540be415410b43cfdcc"
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
    assert_match "0.1.6", shell_output("#{bin}/valet version")
  end
end
