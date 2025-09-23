class KbcliAT101 < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "1.0.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v1.0.1/kbcli-darwin-amd64-v1.0.1.tar.gz"
    sha256 "9d9f6fa790dc3b297ab625d9d885565ea22e463eebe6f56bb81d3e29d02e54a4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v1.0.1/kbcli-darwin-arm64-v1.0.1.tar.gz"
    sha256 "d06cfb2e0bcc7fe0f06c40129635aa340b71cf49c44d38d29d8d4ad6199ed3a1"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v1.0.1/kbcli-linux-amd64-v1.0.1.tar.gz"
    sha256 "4f080a065efd2981b2d0605b58bffdf9ca38ba01f2398bde8ccb6ecf0b33dcb9"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v1.0.1/kbcli-linux-arm64-v1.0.1.tar.gz"
    sha256 "6df3cf367f25f928f9a0ce7532b5a3e2c916849a83f0dfa0d0139d197d6318d6"
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
