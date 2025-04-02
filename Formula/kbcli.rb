class Kbcli < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.9.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.3/kbcli-darwin-amd64-v0.9.3.tar.gz"
    sha256 "3be880b6716dcb100afc3da83485fdb4b894222290e891e8e69e60c0669b1acb"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.3/kbcli-darwin-arm64-v0.9.3.tar.gz"
    sha256 "3be880b6716dcb100afc3da83485fdb4b894222290e891e8e69e60c0669b1acb"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.3/kbcli-linux-amd64-v0.9.3.tar.gz"
    sha256 "3be880b6716dcb100afc3da83485fdb4b894222290e891e8e69e60c0669b1acb"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.3/kbcli-linux-amd64-v0.9.3.tar.gz"
    sha256 "3be880b6716dcb100afc3da83485fdb4b894222290e891e8e69e60c0669b1acb"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.3/kbcli-linux-arm64-v0.9.3.tar.gz"
    sha256 "3be880b6716dcb100afc3da83485fdb4b894222290e891e8e69e60c0669b1acb"
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
