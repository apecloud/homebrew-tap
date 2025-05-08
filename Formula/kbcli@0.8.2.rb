class KbcliAT082 < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.8.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.8.2/kbcli-darwin-amd64-v0.8.2.tar.gz"
    sha256 "be46bb9383e87384ac5b57d5de2cb3f5ea929296f842bb7cfd236fce2e964c73"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.8.2/kbcli-darwin-arm64-v0.8.2.tar.gz"
    sha256 "777e8401f70fbc6f32905672fb9d289e9f44d3d5dc7a11dd2ba51cb2fbdc2ad9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.8.2/kbcli-linux-amd64-v0.8.2.tar.gz"
    sha256 "acfe91ca06f336b785b5beafca9e2d2353cd840c30d41776d9a3980590f273b9"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.8.2/kbcli-linux-arm64-v0.8.2.tar.gz"
    sha256 "eda45306869057ca91e3371b0694b8b51cc8cd45e8e033a0a8d611248f1b7ac5"
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
