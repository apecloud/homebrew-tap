class Kbcli < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.5.0-beta.28"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0-beta.28/kbcli-darwin-amd64-v0.5.0-beta.28.tar.gz"
    sha256 "0aa7d843ceb1a4ce37d709e95f81a4d4da834b42777baa1badc53b78bbe18064"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0-beta.28/kbcli-darwin-arm64-v0.5.0-beta.28.tar.gz"
    sha256 "c21d919d57489a038b8cd6f5de6443bf62e7308ce0c3ed781fa727c517240864"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0-beta.28/kbcli-linux-amd64-v0.5.0-beta.28.tar.gz"
    sha256 "7438ec85f1c615c334f88bb880976c5977bf35ee83e5fbe9ccde3c968992d721"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0-beta.28/kbcli-linux-amd64-v0.5.0-beta.28.tar.gz"
    sha256 "7438ec85f1c615c334f88bb880976c5977bf35ee83e5fbe9ccde3c968992d721"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0-beta.28/kbcli-linux-arm64-v0.5.0-beta.28.tar.gz"
    sha256 "5d4d443c8866733452e973502b623a305638750dde369da64425e69dc2fd6f42"
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
