class KbcliAT091 < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.9.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.1/kbcli-darwin-amd64-v0.9.1.tar.gz"
    sha256 "e2439dbb9c9b50bbb17d1b70977e243b771c483680f5dace5af102d63f367644"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.1/kbcli-darwin-arm64-v0.9.1.tar.gz"
    sha256 "ae64b7a4d45934de7c6a3ba016aba4c60959806fdf1e6c25116321e168371302"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.1/kbcli-linux-amd64-v0.9.1.tar.gz"
    sha256 "d89f632416d7878c60aa6e822b25c7a93d08a608f7f95a2bba7cd669d2953f0d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.1/kbcli-linux-amd64-v0.9.1.tar.gz"
    sha256 "d89f632416d7878c60aa6e822b25c7a93d08a608f7f95a2bba7cd669d2953f0d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.9.1/kbcli-linux-arm64-v0.9.1.tar.gz"
    sha256 "2f1c893783e26e1dd065807dee57db67f5dd82077235a3e86a7519fdd727b33c"
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
