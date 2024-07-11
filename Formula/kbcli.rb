class Kbcli < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.9.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.0/kbcli-darwin-amd64-v0.9.0.tar.gz"
    sha256 "c1d70fa2bbc6a8e22fa187ce44d8997604d78c6450e6d452fabd974f0f2399f8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.0/kbcli-darwin-arm64-v0.9.0.tar.gz"
    sha256 "ad111f9ff7280e836c52e0ca6ab7b41a767a64e80accc0254b5bd3fcfb81372c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.0/kbcli-linux-amd64-v0.9.0.tar.gz"
    sha256 "72019a029d81f89bfdd5bf036c15a69ace6a7df5cc685c81cf3ea7a6e2964121"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.0/kbcli-linux-amd64-v0.9.0.tar.gz"
    sha256 "72019a029d81f89bfdd5bf036c15a69ace6a7df5cc685c81cf3ea7a6e2964121"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.0/kbcli-linux-arm64-v0.9.0.tar.gz"
    sha256 "72019a029d81f89bfdd5bf036c15a69ace6a7df5cc685c81cf3ea7a6e2964121"
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
