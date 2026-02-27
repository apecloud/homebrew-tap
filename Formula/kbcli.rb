class Kbcli < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "1.0.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v1.0.2/kbcli-darwin-amd64-v1.0.2.tar.gz"
    sha256 "948d7522947653a55e71d2e763f65c53a90cdab411170c074196d7aa0da42ac9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v1.0.2/kbcli-darwin-arm64-v1.0.2.tar.gz"
    sha256 "6b451c9202c59a465d05019936dba778652244273bea85b47b928bc88914c857"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v1.0.2/kbcli-linux-amd64-v1.0.2.tar.gz"
    sha256 "3bc2ba09ba2308b66f670c4f986d5f9ecf8c735da83aa8be1f99889c69d4517a"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v1.0.2/kbcli-linux-arm64-v1.0.2.tar.gz"
    sha256 "d02b399cd331367b7f6667e6e481bdd51973e03a9b2a8e0bf9c29801ff6f3074"
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
