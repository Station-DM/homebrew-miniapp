class Miniapp < Formula
  desc "Host SDK integration helper for mini apps"
  homepage "https://github.com/Station-DM/miniapp-cli"
  url "https://github.com/Station-DM/miniapp-cli/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "c7268583d66bc48f2ab4bc9e447af3069cbc4fb03a191e877ccbffaec37f1c83"
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
