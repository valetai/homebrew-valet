class ValetCli < Formula
  desc "Valet runs your agents"
  homepage "https://valet.dev"
  version "0.1.1"

  depends_on "node"

  on_macos do
    depends_on "container"
    if Hardware::CPU.arm?
      url "https://github.com/valetdotdev/homebrew-tap/releases/download/valet-cli-v#{version}/valet-cli-#{version}-darwin-arm64.tar.gz"
      sha256 "079f2158a3223c88e28b51a3f525649c0fb1afbf33ba9e95afbf85fc9373463f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/valetdotdev/homebrew-tap/releases/download/valet-cli-v#{version}/valet-cli-#{version}-linux-arm64.tar.gz"
      sha256 "d185f37225f099d182d65b59db4180ce851007b059b0d86ec1a43f6ee15e2fd1"
    else
      url "https://github.com/valetdotdev/homebrew-tap/releases/download/valet-cli-v#{version}/valet-cli-#{version}-linux-x64.tar.gz"
      sha256 "ecf79fa52c7e713ab35c43881b9ec24d0d4073d1666d4f942cb743558c6b435a"
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
    assert_match "0.1.1", shell_output("#{bin}/valet --version")
  end
end
