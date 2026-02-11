class ValetCli < Formula
  desc "Valet runs your agents"
  homepage "https://valet.dev"
  version "0.1.3"

  depends_on "node"

  on_macos do
    depends_on "container"
    if Hardware::CPU.arm?
      url "https://github.com/valetdotdev/homebrew-tap/releases/download/valet-cli-v#{version}/valet-cli-#{version}-darwin-arm64.tar.gz"
      sha256 "6abf86bf6461158089b681366fe4c3c4fd0e128781a24e827cc6fd188ef992fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/valetdotdev/homebrew-tap/releases/download/valet-cli-v#{version}/valet-cli-#{version}-linux-arm64.tar.gz"
      sha256 "561eaad4cb95ada86f6d65c7c7b3eee93e92c217334ddd59b783dbb4e27a2c8b"
    else
      url "https://github.com/valetdotdev/homebrew-tap/releases/download/valet-cli-v#{version}/valet-cli-#{version}-linux-x64.tar.gz"
      sha256 "7d732dc218772c1b936c8141cc83e885562e5c881df19601d24f075d4790980e"
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
    assert_match "0.1.3", shell_output("#{bin}/valet --version")
  end
end
