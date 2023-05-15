class Kbcli < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.5.0-beta.29"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0-beta.29/kbcli-darwin-amd64-v0.5.0-beta.29.tar.gz"
    sha256 "1b7e83fe704ba0d33b5e0d6b5d61d950c68f5ab6e5c7a87f0e4f5b083e6cec1d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0-beta.29/kbcli-darwin-arm64-v0.5.0-beta.29.tar.gz"
    sha256 "a2aa3d1008f8f2093c8ab3ac564d8cb24b2059b3a5982a5cd676bfe4f6e79b72"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0-beta.29/kbcli-linux-amd64-v0.5.0-beta.29.tar.gz"
    sha256 "1c371bb3503829bb8cd79cf569e32396e9b0c6571141b3da0a3b07556ee973fd"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0-beta.29/kbcli-linux-amd64-v0.5.0-beta.29.tar.gz"
    sha256 "1c371bb3503829bb8cd79cf569e32396e9b0c6571141b3da0a3b07556ee973fd"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0-beta.29/kbcli-linux-arm64-v0.5.0-beta.29.tar.gz"
    sha256 "97804d3000c3ab8ebe553466c94c66596cfd52327cc5ee858f3749ecea01921c"
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
