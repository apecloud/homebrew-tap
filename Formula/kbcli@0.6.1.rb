class KbcliAT061 < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.6.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.6.1/kbcli-darwin-amd64-v0.6.1.tar.gz"
    sha256 "9491d4737000e80bcbdd7a39e9dc13c2178ff865beff7d800d6159bfc395e8fa"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.6.1/kbcli-darwin-arm64-v0.6.1.tar.gz"
    sha256 "f3cc0dba3e1b74cb074117b9905f27a84dbc7e6121938b650fb9b5339d9ad3dc"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.6.1/kbcli-linux-amd64-v0.6.1.tar.gz"
    sha256 "a85384ad353a6abf91bef540d2baf943ba1a1b489ad728ebc76e9c4c006a449c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.6.1/kbcli-linux-amd64-v0.6.1.tar.gz"
    sha256 "a85384ad353a6abf91bef540d2baf943ba1a1b489ad728ebc76e9c4c006a449c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.6.1/kbcli-linux-arm64-v0.6.1.tar.gz"
    sha256 "0eb248a957b247bddd63da5ee86492d43ea8a158f13180614ced8bdc65135c17"
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
