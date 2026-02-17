class ValetCli < Formula
  desc "Valet runs your agents"
  homepage "https://valet.dev"
  version "0.1.8"

  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/valetdotdev/homebrew-tap/releases/download/valet-cli-v#{version}/valet-cli-#{version}-darwin-arm64.tar.gz"
      sha256 "c7c27b34ec606689c41a4a80178c711899084be706eb19bf7049810f16246128"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/valetdotdev/homebrew-tap/releases/download/valet-cli-v#{version}/valet-cli-#{version}-linux-arm64.tar.gz"
      sha256 "c7c27b34ec606689c41a4a80178c711899084be706eb19bf7049810f16246128"
    else
      url "https://github.com/valetdotdev/homebrew-tap/releases/download/valet-cli-v#{version}/valet-cli-#{version}-linux-x64.tar.gz"
      sha256 "c7c27b34ec606689c41a4a80178c711899084be706eb19bf7049810f16246128"
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
    assert_match "0.1.8", shell_output("#{bin}/valet version")
  end
end
