class KbcliAT052 < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.5.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.2/kbcli-darwin-amd64-v0.5.2.tar.gz"
    sha256 "91f635a792b3b66803110212be8c17d3d7baa7c7254519b73bd33180565a3b6b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.2/kbcli-darwin-arm64-v0.5.2.tar.gz"
    sha256 "1a5c657c3ce31f8d81e4748d275cbfc33d82b3231c29c15c434685240597289e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.2/kbcli-linux-amd64-v0.5.2.tar.gz"
    sha256 "9491d4737000e80bcbdd7a39e9dc13c2178ff865beff7d800d6159bfc395e8fa"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.2/kbcli-linux-amd64-v0.5.2.tar.gz"
    sha256 "9491d4737000e80bcbdd7a39e9dc13c2178ff865beff7d800d6159bfc395e8fa"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.2/kbcli-linux-arm64-v0.5.2.tar.gz"
    sha256 "78a054042deddd8619f3025e16e3fb7813828f078f1499c2d57993d15989e221"
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
