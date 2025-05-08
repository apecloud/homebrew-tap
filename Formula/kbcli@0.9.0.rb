class KbcliAT090 < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.9.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.0/kbcli-darwin-amd64-v0.9.0.tar.gz"
    sha256 "8dfcc4b193f36e8bf95546aa1fc3f05b931a8699d217134dc8029cc2addcdd79"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.0/kbcli-darwin-arm64-v0.9.0.tar.gz"
    sha256 "13888682c19321396e92e301bfec78944cb885aa35d23027ca099defe4d4a808"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.0/kbcli-linux-amd64-v0.9.0.tar.gz"
    sha256 "f0ea899287b59900a3aff8efd94498d7a62f7a8051bfbcd371cf936e39965489"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.0/kbcli-linux-arm64-v0.9.0.tar.gz"
    sha256 "a6ab1cd99663bd5eb430a8d754c0a857250eea2b9470831ee3da19ffd3965c69"
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
