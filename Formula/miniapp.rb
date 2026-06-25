class Miniapp < Formula
  desc "Host SDK integration helper for mini apps"
  homepage "https://github.com/Station-DM/miniapp-cli"
  url "https://github.com/Station-DM/miniapp-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "a16f273d0e28eebeae4142e81d61c55cd4daec54c71553dfe7a17c85dec1db5d"
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
