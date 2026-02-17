class TldrCli < Formula
  desc "CLI summarization tool optimized for dyslexia and ADHD"
  homepage "https://github.com/asanmateu/tldr"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v1.0.0/tldr-darwin-arm64.tar.gz"
      sha256 "294b395919d6af11c16024d515543a9770dccb9f7f8d762b3858917fc85619ed"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v1.0.0/tldr-darwin-x64.tar.gz"
      sha256 "4a279fe0b0fca46e614a6605e42c4fbbb887935351cea216844152e3331a8455"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v1.0.0/tldr-linux-arm64.tar.gz"
      sha256 "cdcdf322456043cf453513553c1b0ea9f2c74a7f75581f514d143944e211d24b"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v1.0.0/tldr-linux-x64.tar.gz"
      sha256 "f2e18dd2fde12d607ae50e8bfc1844ee9c31aab6c6c78349cb3a4e888cfe29f6"
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
