class Kbcli < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.5.0-beta.27"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0-beta.27/kbcli-darwin-amd64-v0.5.0-beta.27.tar.gz"
    sha256 "09b89459de1f86c1c230ef1d4ccf1f04592a594cda6fd151e6b19d8630e680c2"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0-beta.27/kbcli-darwin-arm64-v0.5.0-beta.27.tar.gz"
    sha256 "88b50c02b4006fc2b10474c97ce6c1fa0f1b43e757f2c42d452c4dfd99a91261"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0-beta.27/kbcli-linux-amd64-v0.5.0-beta.27.tar.gz"
    sha256 "1b50cb1aaceffa3b8bdd398818b3d7b980b426a72b5cd0ca5913ddd051fb8425"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0-beta.27/kbcli-linux-amd64-v0.5.0-beta.27.tar.gz"
    sha256 "1b50cb1aaceffa3b8bdd398818b3d7b980b426a72b5cd0ca5913ddd051fb8425"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0-beta.27/kbcli-linux-arm64-v0.5.0-beta.27.tar.gz"
    sha256 "fb50c658839bfb1ac6e2c0d346db7162677387ad21331d071f99c192d5db4b6d"
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
