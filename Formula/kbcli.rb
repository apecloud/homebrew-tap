class Kbcli < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.5.0-beta.32"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0-beta.32/kbcli-darwin-amd64-v0.5.0-beta.32.tar.gz"
    sha256 "64680b705c8433bf5bec7ee43e57abc53136fdd70fa516e9d61d942308c2178f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0-beta.32/kbcli-darwin-arm64-v0.5.0-beta.32.tar.gz"
    sha256 "1d915012fdf409291cf0b06cedb3970662cb9f19b680e0de44f2824dffe548a7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0-beta.32/kbcli-linux-amd64-v0.5.0-beta.32.tar.gz"
    sha256 "082838a7ee1d1734fb10ba186af61d7681264f62577b324e565b0925ea7877a8"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0-beta.32/kbcli-linux-amd64-v0.5.0-beta.32.tar.gz"
    sha256 "082838a7ee1d1734fb10ba186af61d7681264f62577b324e565b0925ea7877a8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.5.0-beta.32/kbcli-linux-arm64-v0.5.0-beta.32.tar.gz"
    sha256 "65f7ed3ddbe566489c88459096373d8bec8a1a5f00a90930530d4f465b33ddf5"
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
