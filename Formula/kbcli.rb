class Kbcli < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.5.0-beta.31"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0-beta.31/kbcli-darwin-amd64-v0.5.0-beta.31.tar.gz"
    sha256 "3ca83b69470fe0cfa2ef27bcab1f21adbbbf9efa7649e665827d3d73a5bb4ebe"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0-beta.31/kbcli-darwin-arm64-v0.5.0-beta.31.tar.gz"
    sha256 "682fc7071bb9fc9e5de7de30e87b73a8ad0dfd74fac0557e1501d050ad844d0d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0-beta.31/kbcli-linux-amd64-v0.5.0-beta.31.tar.gz"
    sha256 "3ce7d18e7b2850d4a089a1eb7d3a0d0eb0a853512a4d6ac6d1d6691a741611a5"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0-beta.31/kbcli-linux-amd64-v0.5.0-beta.31.tar.gz"
    sha256 "3ce7d18e7b2850d4a089a1eb7d3a0d0eb0a853512a4d6ac6d1d6691a741611a5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0-beta.31/kbcli-linux-arm64-v0.5.0-beta.31.tar.gz"
    sha256 "4739459931d1aa7faf4c989dd3a163ed7b615dbe36b54fad46f7b9ab0f61cb58"
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
