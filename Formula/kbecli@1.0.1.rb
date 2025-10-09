class KbecliAT101 < Formula
  desc "Command-line for KubeBlocks Enterprise"
  homepage "https://kubeblocks.io/"
  version "1.0.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/291099/packages/generic/kubeblocks/v1.0.1/kbecli-darwin-amd64-v1.0.1.tar.gz"
    sha256 "9491d4737000e80bcbdd7a39e9dc13c2178ff865beff7d800d6159bfc395e8fa"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/291099/packages/generic/kubeblocks/v1.0.1/kbecli-darwin-arm64-v1.0.1.tar.gz"
    sha256 "9491d4737000e80bcbdd7a39e9dc13c2178ff865beff7d800d6159bfc395e8fa"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/291099/packages/generic/kubeblocks/v1.0.1/kbecli-linux-amd64-v1.0.1.tar.gz"
    sha256 "9491d4737000e80bcbdd7a39e9dc13c2178ff865beff7d800d6159bfc395e8fa"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/291099/packages/generic/kubeblocks/v1.0.1/kbecli-linux-arm64-v1.0.1.tar.gz"
    sha256 "9491d4737000e80bcbdd7a39e9dc13c2178ff865beff7d800d6159bfc395e8fa"
  end

  conflicts_with "kbecli"

  def install
    bin.install "kbecli"
    generate_completions_from_executable(bin/"kbecli", "completion", shells: [:bash, :zsh])
  end

  test do
    system "#{bin}/kbecli", "version"
  end
end
