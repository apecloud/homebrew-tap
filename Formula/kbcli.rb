class Kbcli < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.5.0-alpha.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/apecloud/kbcli/releases/download/v0.5.0-alpha.0/kbcli-darwin-amd64-v0.5.0-alpha.0.tar.gz"
    sha256 "33317be3af53a0b44d8ccedd37b7e4f0cc38ed2332d02cd70b1b26d442bb34e8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/apecloud/kbcli/releases/download/v0.5.0-alpha.0/kbcli-darwin-arm64-v0.5.0-alpha.0.tar.gz"
    sha256 "efb5a65c36d07426911b22461c429c4cb64a9276dee605e9b46915a4397a123a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/apecloud/kbcli/releases/download/v0.5.0-alpha.0/kbcli-linux-amd64-v0.5.0-alpha.0.tar.gz"
    sha256 "e9e45da4d10517c054f32c7432eafac86ca1b36f6e20e76d73f71d571d3f1b99"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/apecloud/kbcli/releases/download/v0.5.0-alpha.0/kbcli-linux-amd64-v0.5.0-alpha.0.tar.gz"
    sha256 "e9e45da4d10517c054f32c7432eafac86ca1b36f6e20e76d73f71d571d3f1b99"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/apecloud/kbcli/releases/download/v0.5.0-alpha.0/kbcli-linux-arm64-v0.5.0-alpha.0.tar.gz"
    sha256 "adfb74566b717af51950cc4591dc673e273d52ed8f1c60eda1d849ebb36d3ec3"
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
