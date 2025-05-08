class KbcliAT093 < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.9.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.3/kbcli-darwin-amd64-v0.9.3.tar.gz"
    sha256 "99486f7c8a6c7a1fbf2157e5f928e7b95419dcfb95730cabec3a73f3dd8fa0ba"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.3/kbcli-darwin-arm64-v0.9.3.tar.gz"
    sha256 "3be880b6716dcb100afc3da83485fdb4b894222290e891e8e69e60c0669b1acb"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.3/kbcli-linux-amd64-v0.9.3.tar.gz"
    sha256 "959cb96a152d0382866615d701a41d5015c010584a312185d562c9e89c11ae0a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.3/kbcli-linux-amd64-v0.9.3.tar.gz"
    sha256 "959cb96a152d0382866615d701a41d5015c010584a312185d562c9e89c11ae0a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.3/kbcli-linux-arm64-v0.9.3.tar.gz"
    sha256 "0c80c385f51e8b1ac3a97073baa302fdbecce6c0b9cc4b56888f2b19ff7d0ff1"
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
