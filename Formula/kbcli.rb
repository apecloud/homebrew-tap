class Kbcli < Formula
  desc "Command-line for KubeBlocks"
  homepage "https://kubeblocks.io/"
  version "0.6.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.6.4/kbcli-darwin-amd64-v0.6.4.tar.gz"
    sha256 "473b3b5302a83a8604962b613f328a33e51a615c8fc1438db59916342019ced7"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.6.4/kbcli-darwin-arm64-v0.6.4.tar.gz"
    sha256 "06bf7b2f047ef19851347a8750e0c91e808b5b45b29178e3ace23ff8f1dd1e06"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.6.4/kbcli-linux-amd64-v0.6.4.tar.gz"
    sha256 "b36094e6c1caabd094bff89651c6b8424c883c7ad61b8a45b0580e02489ff2af"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.6.4/kbcli-linux-amd64-v0.6.4.tar.gz"
    sha256 "b36094e6c1caabd094bff89651c6b8424c883c7ad61b8a45b0580e02489ff2af"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://jihulab.com/api/v4/projects/85948/packages/generic/kubeblocks/v0.6.4/kbcli-linux-arm64-v0.6.4.tar.gz"
    sha256 "b36094e6c1caabd094bff89651c6b8424c883c7ad61b8a45b0580e02489ff2af"
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
