class TldrCli < Formula
  desc "CLI summarization tool optimized for dyslexia and ADHD"
  homepage "https://github.com/asanmateu/tldr"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v0.8.0/tldr-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v0.8.0/tldr-darwin-x64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v0.8.0/tldr-linux-arm64.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v0.8.0/tldr-linux-x64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin_name = Dir.glob("tldr-*").first
    bin.install bin_name => "tldr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tldr --version")
  end
end
