class TldrCli < Formula
  desc "CLI summarization tool optimized for dyslexia and ADHD"
  homepage "https://github.com/asanmateu/tldr"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v0.10.0/tldr-darwin-arm64.tar.gz"
      sha256 "044706ece57bd1b79bc41844c6f42bb1342ac2c1220784bcc3a78311c9c803b2"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v0.10.0/tldr-darwin-x64.tar.gz"
      sha256 "2835b54511199748f94f67b48b3ce8b4aa6adc395131823da7944c6dd8f49856"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v0.10.0/tldr-linux-arm64.tar.gz"
      sha256 "0426967fd281ddd01abb16b2558508a938aae75bf7b9c8a0ddec4f2d907f6429"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v0.10.0/tldr-linux-x64.tar.gz"
      sha256 "7b7cec79c6168c934d69842cffda0d9002aac4a090dd1de787e5dc1e4db32de2"
    end
  end

  def install
    bin_name = Dir.glob("tldr-*").first
    bin.install bin_name => "tldr"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/tldr --version")
  end
end
