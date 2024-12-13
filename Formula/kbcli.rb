class Kbcli < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.9.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.2/kbcli-darwin-amd64-v0.9.2.tar.gz"
    sha256 "6c57c12f6a0a7cfdd1db99181b3dc94c0b432604026d8d02c80ce8194397e526"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.2/kbcli-darwin-arm64-v0.9.2.tar.gz"
    sha256 "6c57c12f6a0a7cfdd1db99181b3dc94c0b432604026d8d02c80ce8194397e526"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.2/kbcli-linux-amd64-v0.9.2.tar.gz"
    sha256 "6c57c12f6a0a7cfdd1db99181b3dc94c0b432604026d8d02c80ce8194397e526"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.2/kbcli-linux-amd64-v0.9.2.tar.gz"
    sha256 "6c57c12f6a0a7cfdd1db99181b3dc94c0b432604026d8d02c80ce8194397e526"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.2/kbcli-linux-arm64-v0.9.2.tar.gz"
    sha256 "6c57c12f6a0a7cfdd1db99181b3dc94c0b432604026d8d02c80ce8194397e526"
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
