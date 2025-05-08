class KbcliAT081 < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.8.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.8.1/kbcli-darwin-amd64-v0.8.1.tar.gz"
    sha256 "3bdbe66ff85d5d7995992eb1725d53cbb99d41034d589f7ab63b043234d5e94f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.8.1/kbcli-darwin-arm64-v0.8.1.tar.gz"
    sha256 "1e17d8b1d0bcdafba97b597ca588080db738b290e241ef787a52c0aeab006ded"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.8.1/kbcli-linux-amd64-v0.8.1.tar.gz"
    sha256 "e5f989fbf0d8e80929d72023151b8453eacf04a5477319e879230721b20dc11b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.8.1/kbcli-linux-amd64-v0.8.1.tar.gz"
    sha256 "e5f989fbf0d8e80929d72023151b8453eacf04a5477319e879230721b20dc11b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.8.1/kbcli-linux-arm64-v0.8.1.tar.gz"
    sha256 "1f8ad9e74d908962c97dda4f904946f4274ac629e502a635896154f5e3b00631"
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
