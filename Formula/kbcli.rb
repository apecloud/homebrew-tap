class Kbcli < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.9.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.1/kbcli-darwin-amd64-v0.9.1.tar.gz"
    sha256 "9668eb4bf374253f6f5ea7399d8d63ce7d3788ae9129c89c5e31ea9de3cded18"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.1/kbcli-darwin-arm64-v0.9.1.tar.gz"
    sha256 "9668eb4bf374253f6f5ea7399d8d63ce7d3788ae9129c89c5e31ea9de3cded18"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.1/kbcli-linux-amd64-v0.9.1.tar.gz"
    sha256 "9668eb4bf374253f6f5ea7399d8d63ce7d3788ae9129c89c5e31ea9de3cded18"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.1/kbcli-linux-amd64-v0.9.1.tar.gz"
    sha256 "9668eb4bf374253f6f5ea7399d8d63ce7d3788ae9129c89c5e31ea9de3cded18"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.1/kbcli-linux-arm64-v0.9.1.tar.gz"
    sha256 "9668eb4bf374253f6f5ea7399d8d63ce7d3788ae9129c89c5e31ea9de3cded18"
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
