class KbcliAT083 < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.8.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.8.3/kbcli-darwin-amd64-v0.8.3.tar.gz"
    sha256 "71e4d1cd47dfc0fb5f5efc2a424837ea1ebfe3124b2cd14a08e3dfe15ee44085"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.8.3/kbcli-darwin-arm64-v0.8.3.tar.gz"
    sha256 "f3a497e0b78b97b7e422ad69621958380495131626fcffabd37341431aecffc5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.8.3/kbcli-linux-amd64-v0.8.3.tar.gz"
    sha256 "e1c09b72d71b341f2a275105431ba689e23b76e32343136234ce2b424cc1ecac"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.8.3/kbcli-linux-amd64-v0.8.3.tar.gz"
    sha256 "e1c09b72d71b341f2a275105431ba689e23b76e32343136234ce2b424cc1ecac"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.8.3/kbcli-linux-arm64-v0.8.3.tar.gz"
    sha256 "e1c09b72d71b341f2a275105431ba689e23b76e32343136234ce2b424cc1ecac"
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
