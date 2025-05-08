class KbcliAT063 < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.6.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.6.3/kbcli-darwin-amd64-v0.6.3.tar.gz"
    sha256 "b9cc4a96d7818128f3403865b59a84f70625f10234db105edc47c0a9a013b6db"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.6.3/kbcli-darwin-arm64-v0.6.3.tar.gz"
    sha256 "dc8d2c5fcb007b1ec215db735088b563c5cbe8a44ce64d386fb348e6f588dbfb"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.6.3/kbcli-linux-amd64-v0.6.3.tar.gz"
    sha256 "629266d367b002072abcb4a3783623f8bf6d729e8c64fefbdf7f9cf5be47f134"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.6.3/kbcli-linux-amd64-v0.6.3.tar.gz"
    sha256 "629266d367b002072abcb4a3783623f8bf6d729e8c64fefbdf7f9cf5be47f134"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.6.3/kbcli-linux-arm64-v0.6.3.tar.gz"
    sha256 "6e51963b52090c261528624f3ac63e784b72832e2038ebbf66f4453803d01fe4"
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
