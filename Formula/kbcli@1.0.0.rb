class KbcliAT100 < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "1.0.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v1.0.0/kbcli-darwin-amd64-v1.0.0.tar.gz"
    sha256 "9f31f8255c423be1d91c628df04c39214ac66be0ca82e95ab047cc87388298df"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v1.0.0/kbcli-darwin-arm64-v1.0.0.tar.gz"
    sha256 "be8cfe215ed16b548debb992f78bdaab9383f116eeaf55bdbce141ad76180084"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v1.0.0/kbcli-linux-amd64-v1.0.0.tar.gz"
    sha256 "6e091016f6ba0a93eb4f490512e87513a71a506c73c012b127dbbe8852a4c56c"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v1.0.0/kbcli-linux-arm64-v1.0.0.tar.gz"
    sha256 "4f4f6e41b797da25164bb4af7c884b255f16fc99fa12c90ba019cfb1ec66370f"
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
