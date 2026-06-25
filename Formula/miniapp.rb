class Miniapp < Formula
  desc "Host SDK integration helper for mini apps"
  homepage "https://github.com/Station-DM/miniapp-cli"
  url "https://github.com/Station-DM/miniapp-cli/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "bd6876d8062fb1c4b8458ceb57bcc6a318d6dcf02fa84f17d949862242cfcc3c"
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
