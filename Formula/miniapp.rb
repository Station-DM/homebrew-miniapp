class Miniapp < Formula
  desc "Host SDK integration helper for mini apps"
  homepage "https://github.com/Station-DM/miniapp-cli"
  url "https://github.com/Station-DM/miniapp-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "b35386d8cd309e45fa63849823720607634b7b84703b2afa018620fa83b35e83"
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
