class Miniapp < Formula
  desc "Host SDK integration helper for mini apps"
  homepage "https://github.com/Station-DM/miniapp-cli"
  url "https://github.com/Station-DM/miniapp-cli/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "ccd9cc92fa18f697d7286fd93c70a65efab2f0fc433b5bcadea77408908bb345"
  license "MIT"

  depends_on macos: :ventura

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/miniapp"
  end

  test do
    output = shell_output("#{bin}/miniapp --help")
    assert_match "miniapp host sdk install", output
  end
end
