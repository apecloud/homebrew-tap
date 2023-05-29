class KbcliAT051 < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.5.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.1/kbcli-darwin-amd64-v0.5.1.tar.gz"
    sha256 "45af9894bd27fb08a4e4827e72390dceed3cec940a38e27746426ad1fac53c3b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.1/kbcli-darwin-arm64-v0.5.1.tar.gz"
    sha256 "bdc8002d842bb8e6916d892d32e51721c479eef1ecf77d2c0b4866ee7fd815dd"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.1/kbcli-linux-amd64-v0.5.1.tar.gz"
    sha256 "be5a56ab93527f87004aa1dbcb4f8ee95faa24c92e203e8cca759d7da7a87741"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.1/kbcli-linux-amd64-v0.5.1.tar.gz"
    sha256 "be5a56ab93527f87004aa1dbcb4f8ee95faa24c92e203e8cca759d7da7a87741"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.1/kbcli-linux-arm64-v0.5.1.tar.gz"
    sha256 "ff0d5ed6c986f87823b6bb642ce019bf0341c64918078e8a96053d988ca16fe9"
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
