class KbcliAT080 < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.8.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.8.0/kbcli-darwin-amd64-v0.8.0.tar.gz"
    sha256 "b9cc46b1b55062d8540594e9433cd416d8fa12f77b480af64b75d5844fef2ff9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.8.0/kbcli-darwin-arm64-v0.8.0.tar.gz"
    sha256 "f776d9804b50225bf036c3707d33a2b608a651ddddf5157160ae3e956b95b8eb"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.8.0/kbcli-linux-amd64-v0.8.0.tar.gz"
    sha256 "b54865bc34c066aa1ee29923b7eb837601d285330eb4e53a7da341315a790e52"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.8.0/kbcli-linux-amd64-v0.8.0.tar.gz"
    sha256 "b54865bc34c066aa1ee29923b7eb837601d285330eb4e53a7da341315a790e52"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.8.0/kbcli-linux-arm64-v0.8.0.tar.gz"
    sha256 "d5d26f051ce3e4fc5d6c4368177c4d45b37ffeb75d64452b120338070a099734"
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
