class KbcliAT092 < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.9.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.2/kbcli-darwin-amd64-v0.9.2.tar.gz"
    sha256 "9491d4737000e80bcbdd7a39e9dc13c2178ff865beff7d800d6159bfc395e8fa"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.2/kbcli-darwin-arm64-v0.9.2.tar.gz"
    sha256 "9491d4737000e80bcbdd7a39e9dc13c2178ff865beff7d800d6159bfc395e8fa"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.2/kbcli-linux-amd64-v0.9.2.tar.gz"
    sha256 "9491d4737000e80bcbdd7a39e9dc13c2178ff865beff7d800d6159bfc395e8fa"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.2/kbcli-linux-amd64-v0.9.2.tar.gz"
    sha256 "9491d4737000e80bcbdd7a39e9dc13c2178ff865beff7d800d6159bfc395e8fa"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.2/kbcli-linux-arm64-v0.9.2.tar.gz"
    sha256 "9491d4737000e80bcbdd7a39e9dc13c2178ff865beff7d800d6159bfc395e8fa"
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
