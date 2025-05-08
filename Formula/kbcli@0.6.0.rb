class KbcliAT060 < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.6.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.6.0/kbcli-darwin-amd64-v0.6.0.tar.gz"
    sha256 "f81dba8eab8319b818653d04fa8cc71b3b2986c73784ee616dcd73827496fbed"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.6.0/kbcli-darwin-arm64-v0.6.0.tar.gz"
    sha256 "c407ae92c101f4809fe6d3920abc317d4738016ad23b9249fe3d13fe7c4e4464"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.6.0/kbcli-linux-amd64-v0.6.0.tar.gz"
    sha256 "4f00483b7fdd4080cfae566d9948e2613cdbcb30561d3437d80e070ef80f5985"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.6.0/kbcli-linux-arm64-v0.6.0.tar.gz"
    sha256 "6f1db70b1700af3b454caaf12c2ef2d1b90ceacf2ba08ea42d6eebbae5b9a735"
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
