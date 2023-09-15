class Kbcli < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.6.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.6.2/kbcli-darwin-amd64-v0.6.2.tar.gz"
    sha256 "fa4914b988d5f0a126b94c7b88cc3081e31b75b3b28028cf24f28dbd02e1e487"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.6.2/kbcli-darwin-arm64-v0.6.2.tar.gz"
    sha256 "788b3307082f4957530920cb4b7e8564fa74a682f08ff374cc147a22f57b6bf6"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.6.2/kbcli-linux-amd64-v0.6.2.tar.gz"
    sha256 "7b4ee4333a04e2b07965e646546b2ecac94dedab1cb8a15b21645d1addacd8df"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.6.2/kbcli-linux-amd64-v0.6.2.tar.gz"
    sha256 "7b4ee4333a04e2b07965e646546b2ecac94dedab1cb8a15b21645d1addacd8df"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.6.2/kbcli-linux-arm64-v0.6.2.tar.gz"
    sha256 "bb5b1258a7a9032299ad25797c7b89f9a6151f6eb4d0c91c4b694ac6c2054633"
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
