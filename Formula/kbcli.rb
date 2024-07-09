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
    sha256 "1e5869cfd0e49cf81ec91a48af28c3c874d0e230db28d0e955fec5686ca3c35f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.0/kbcli-linux-amd64-v0.9.0.tar.gz"
    sha256 "1e5869cfd0e49cf81ec91a48af28c3c874d0e230db28d0e955fec5686ca3c35f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.0/kbcli-linux-arm64-v0.9.0.tar.gz"
    sha256 "1e5869cfd0e49cf81ec91a48af28c3c874d0e230db28d0e955fec5686ca3c35f"
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
