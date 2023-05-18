class KbcliAT050 < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.5.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0/kbcli-darwin-amd64-v0.5.0.tar.gz"
    sha256 "15f4e43119d1abff3105ec4973b1b734498ffbc3f68ce6aa6d055e398078d41f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0/kbcli-darwin-arm64-v0.5.0.tar.gz"
    sha256 "8ed2698b15bb13c888aac8cd0a5c1fee432d436260cbb1fdfc2edde6c8270a22"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0/kbcli-linux-amd64-v0.5.0.tar.gz"
    sha256 "f87007dd5f10b9f43a6ed5909c8d78e00133b0f8206a94934cc8bb61f9867038"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0/kbcli-linux-amd64-v0.5.0.tar.gz"
    sha256 "f87007dd5f10b9f43a6ed5909c8d78e00133b0f8206a94934cc8bb61f9867038"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0/kbcli-linux-arm64-v0.5.0.tar.gz"
    sha256 "07744ef5c16e0069173b77ed5f9d91b3a62965ed236af1acc0d869b2b963accb"
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
