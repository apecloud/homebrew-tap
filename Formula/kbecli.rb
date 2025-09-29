class Kbecli < Formula
  desc "Command-line for KubeBlocks Enterprise"
  homepage "https://kubeblocks.io/"
  version "0.1.0-alpha.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/291099/packages/generic/kubeblocks/v0.1.0-alpha.3/kbecli-darwin-amd64-v0.1.0-alpha.3.tar.gz"
    sha256 "31b55e5e5b3a6b69dbd3e666ce5cfbf7a8a2fc2013b82658a1b30afdce055cb8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/291099/packages/generic/kubeblocks/v0.1.0-alpha.3/kbecli-darwin-arm64-v0.1.0-alpha.3.tar.gz"
    sha256 "60f23d2268636a7d0acb3af2c88639618662254d327eab321f74dc4276cd7a7f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://jihulab.com/api/v4/projects/291099/packages/generic/kubeblocks/v0.1.0-alpha.3/kbecli-linux-amd64-v0.1.0-alpha.3.tar.gz"
    sha256 "4957e453aee488c5a3c557891a9e1547221da94a3a84218acc13a6e8b981bf33"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://jihulab.com/api/v4/projects/291099/packages/generic/kubeblocks/v0.1.0-alpha.3/kbecli-linux-arm64-v0.1.0-alpha.3.tar.gz"
    sha256 "f3916bee5ba1203ad6d9aa8ca0fd2a438308cb8eecf33d5c7ba01b0be5014f1b"
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
