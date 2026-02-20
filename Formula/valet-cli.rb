class ValetCli < Formula
  desc "Valet runs your agents"
  homepage "https://valet.dev"
  version "0.1.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/valetdotdev/homebrew-tap/releases/download/valet-cli-v#{version}/valet-cli-#{version}-darwin-arm64.tar.gz"
      sha256 "959b082e7543a99ee8bdbadb7d5519b664ba708ff19bab3520bbeb34a0ce1afb"
    else
      url "https://github.com/valetdotdev/homebrew-tap/releases/download/valet-cli-v#{version}/valet-cli-#{version}-darwin-amd64.tar.gz"
      sha256 "6d1d4d04f477d3a42668cb2eb63534aeedec6860f352acd4a122dde6adef09b2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/valetdotdev/homebrew-tap/releases/download/valet-cli-v#{version}/valet-cli-#{version}-linux-arm64.tar.gz"
      sha256 "d8e3b87d9056ccee20354b0290811f78819372548d5edccca2bc3d64bce2f16d"
    else
      url "https://github.com/valetdotdev/homebrew-tap/releases/download/valet-cli-v#{version}/valet-cli-#{version}-linux-amd64.tar.gz"
      sha256 "cfb3e0cf52e34a324349fee901d4f6f863c078eff42aee875eb3d8e0bcae706f"
    end
  end

  def install
    bin.install "valet"
  end

  def caveats
    <<~EOS
      To get started, run:
        valet onboard
    EOS
  end

  test do
    assert_match "0.1.9", shell_output("#{bin}/valet version")
  end
end
