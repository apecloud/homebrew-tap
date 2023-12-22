class KbcliAT072 < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.7.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.7.2/kbcli-darwin-amd64-v0.7.2.tar.gz"
    sha256 "5262e3280d4387bf56f8b011fdaab975d23d35808407647436c407f9930d0230"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.7.2/kbcli-darwin-arm64-v0.7.2.tar.gz"
    sha256 "91ab8d248bf065b40dd0f8899174ea5c9752173d0c802b81278e250527dd001b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.7.2/kbcli-linux-amd64-v0.7.2.tar.gz"
    sha256 "b11ace8d151f693065582ecb767fdb26fd1e80a1435759b1f1976c9cbd8b9cb1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.7.2/kbcli-linux-amd64-v0.7.2.tar.gz"
    sha256 "b11ace8d151f693065582ecb767fdb26fd1e80a1435759b1f1976c9cbd8b9cb1"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.7.2/kbcli-linux-arm64-v0.7.2.tar.gz"
    sha256 "b11ace8d151f693065582ecb767fdb26fd1e80a1435759b1f1976c9cbd8b9cb1"
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
