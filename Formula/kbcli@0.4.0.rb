class KbcliAT040 < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.4.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/apecloud/kbcli/releases/download/v0.4.0/kbcli-darwin-amd64-v0.4.0.tar.gz"
    sha256 "c358e28cbc5c9c26904247db4a29419d6ca8e32774e2ea1690a1b267619e76f4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/apecloud/kbcli/releases/download/v0.4.0/kbcli-darwin-arm64-v0.4.0.tar.gz"
    sha256 "acfff4dcbe2c1886a780ce04b25924582497ea373482d7a6ce50727087b5b317"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/apecloud/kbcli/releases/download/v0.4.0/kbcli-linux-amd64-v0.4.0.tar.gz"
    sha256 "3c2d4445ec3f1d9243948edf856cf299be7b1dc1ea8697b872b9b13ecadc8f6e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/apecloud/kbcli/releases/download/v0.4.0/kbcli-linux-amd64-v0.4.0.tar.gz"
    sha256 "3c2d4445ec3f1d9243948edf856cf299be7b1dc1ea8697b872b9b13ecadc8f6e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/apecloud/kbcli/releases/download/v0.4.0/kbcli-linux-arm64-v0.4.0.tar.gz"
    sha256 "05e8e8a318e736b11a75c1b2e7508b6729f8728ccfcb68f872883f7988cdbb22"
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
