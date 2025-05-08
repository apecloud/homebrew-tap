class KbcliAT071 < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.7.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.7.1/kbcli-darwin-amd64-v0.7.1.tar.gz"
    sha256 "84547972ab337a7637762adea5e1be3e20c8d2bb91cadc29ca0a23aaaf7525bd"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.7.1/kbcli-darwin-arm64-v0.7.1.tar.gz"
    sha256 "8ec38cae7b3ac87ee3b71acefc2091d507e76d2c68c1737b7703de7eb836d114"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.7.1/kbcli-linux-amd64-v0.7.1.tar.gz"
    sha256 "f9134b853f37b0662de42acd7812c5e1d16fdd019f8f625d834e15bedf826bfc"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.7.1/kbcli-linux-arm64-v0.7.1.tar.gz"
    sha256 "7bee4b1e84b83853298c7e82f8af41cd902b29424003532f55aa555520909618"
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
