class KbcliAT091 < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.9.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.1/kbcli-darwin-amd64-v0.9.1.tar.gz"
    sha256 "96f3fbff7e7516c8de2c5be62e60b87806fd6d567b79b7b1f8db8703df7b3fec"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.1/kbcli-darwin-arm64-v0.9.1.tar.gz"
    sha256 "0542d792c4334992904372723493df063da01de62e073dbb25998aa379e19483"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.1/kbcli-linux-amd64-v0.9.1.tar.gz"
    sha256 "7a7deb635e9a920dae06af1d07fc41367c5c158160ffbf730a501f1c3dca42c7"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.1/kbcli-linux-amd64-v0.9.1.tar.gz"
    sha256 "7a7deb635e9a920dae06af1d07fc41367c5c158160ffbf730a501f1c3dca42c7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.1/kbcli-linux-arm64-v0.9.1.tar.gz"
    sha256 "7a7deb635e9a920dae06af1d07fc41367c5c158160ffbf730a501f1c3dca42c7"
  end

  conflicts_with "kbcli"

  def install
    bin.install "kbcli"
    generate_completions_from_executable(bin/"kbcli", "completion", shells: [:bash, :zsh])
  end

  test do
    system "#{bin}/kbcli", "version"
  end
end
