class KbecliAT010 < Formula
  desc "Command-line for KubeBlocks Enterprise"
  homepage "https://kubeblocks.io/"
  version "0.1.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/291099/packages/generic/kubeblocks/v0.1.0/kbecli-darwin-amd64-v0.1.0.tar.gz"
    sha256 "e154cd6e2ec2fd64a1f8e51871184a9f5afc291115f4da196e6922c17cc789f0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/291099/packages/generic/kubeblocks/v0.1.0/kbecli-darwin-arm64-v0.1.0.tar.gz"
    sha256 "200ead9f6157f5bba59525e284fcced88bb9b731759b6d3130faa61bd1db719b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/291099/packages/generic/kubeblocks/v0.1.0/kbecli-linux-amd64-v0.1.0.tar.gz"
    sha256 "c569138b8059541cf3d2ef0782d189fc9444b33b866d9bd3c36904b6c9f71382"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/291099/packages/generic/kubeblocks/v0.1.0/kbecli-linux-arm64-v0.1.0.tar.gz"
    sha256 "d0d1c9eca2f27204ec1a9ac5f3943bfd0ff56857f350719f8e77b222acc7a24b"
  end

  conflicts_with "kbecli"

  def install
    bin.install "kbecli"
    generate_completions_from_executable(bin/"kbecli", "completion", shells: [:bash, :zsh])
  end

  test do
    system "#{bin}/kbecli", "version"
  end
end
