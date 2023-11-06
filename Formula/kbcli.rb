class Kbcli < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.7.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.7.0/kbcli-darwin-amd64-v0.7.0.tar.gz"
    sha256 "b426a2e02c7da079cf50e27e877b1df28b652e549809b80eb7ecb680c82e0e10"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.7.0/kbcli-darwin-arm64-v0.7.0.tar.gz"
    sha256 "e9aeecff7e5bff70a41d7024feb449a572cd83ae2072287fb4d851b64760a278"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.7.0/kbcli-linux-amd64-v0.7.0.tar.gz"
    sha256 "014fc60cdc3f5a12e0c48751824323db2f66564e81b4619b27a7ca7f80960086"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.7.0/kbcli-linux-amd64-v0.7.0.tar.gz"
    sha256 "014fc60cdc3f5a12e0c48751824323db2f66564e81b4619b27a7ca7f80960086"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.7.0/kbcli-linux-arm64-v0.7.0.tar.gz"
    sha256 "014fc60cdc3f5a12e0c48751824323db2f66564e81b4619b27a7ca7f80960086"
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
