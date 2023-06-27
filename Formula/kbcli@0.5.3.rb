class KbcliAT053 < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.5.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.3/kbcli-darwin-amd64-v0.5.3.tar.gz"
    sha256 "96a3c46ef4f2112c7f4115d02fe727aed4affd220b3f9301eea9d7bb7ea9022d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.3/kbcli-darwin-arm64-v0.5.3.tar.gz"
    sha256 "4e90fac4ce6a606e1d57e14802faccf80b49fa3eb73b9a7df6ecac8f740a124b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.3/kbcli-linux-amd64-v0.5.3.tar.gz"
    sha256 "028acd83b444619150da1a3a03d052d75d790a7622b9e63f8d04889cb39600b1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.3/kbcli-linux-amd64-v0.5.3.tar.gz"
    sha256 "028acd83b444619150da1a3a03d052d75d790a7622b9e63f8d04889cb39600b1"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.3/kbcli-linux-arm64-v0.5.3.tar.gz"
    sha256 "d993dd547dfebd4fef0a8e4bb3df8580c20b4e81e45784effc2af2d4a58675ea"
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
