class KbecliAT015 < Formula
  desc "Command-line for KubeBlocks Enterprise"
  homepage "https://kubeblocks.io/"
  version "0.1.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/291099/packages/generic/kubeblocks/v0.1.5/kbecli-darwin-amd64-v0.1.5.tar.gz"
    sha256 "c3d1ea6af28778f2e739a86492e27b555694729a1b51c50c0fb6b690987fb02b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/291099/packages/generic/kubeblocks/v0.1.5/kbecli-darwin-arm64-v0.1.5.tar.gz"
    sha256 "6e240ef48093980262655947b1c3b730e515d251a04a7a362a0dbb0288fa31cf"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/291099/packages/generic/kubeblocks/v0.1.5/kbecli-linux-amd64-v0.1.5.tar.gz"
    sha256 "20b1245dabb0681562480878a75064c950327529b783210d369decd720da9761"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/291099/packages/generic/kubeblocks/v0.1.5/kbecli-linux-arm64-v0.1.5.tar.gz"
    sha256 "9c25e00721a1777bdcb37c6a0397e0f71fa2270cbf5cae59b3a822fb9038b86e"
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
