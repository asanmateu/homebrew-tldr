class TldrCli < Formula
  desc "CLI summarization tool optimised for neurodiversity"
  homepage "https://github.com/asanmateu/tldr"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v1.2.0/tldr-darwin-arm64.tar.gz"
      sha256 "be21c8c6caa02afd5e0d796ddecf4d6f49cda0d27aa6616abf39dd7209534ad3"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v1.2.0/tldr-darwin-x64.tar.gz"
      sha256 "a4ccdb33b98809d1c40b23a8e995b33331d8c141f3ef9a2d483bae4109ae598a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v1.2.0/tldr-linux-arm64.tar.gz"
      sha256 "22c9df628d56ef796f49c7234e4cebf1616c12c2ef8071dbf11ce181d5395453"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v1.2.0/tldr-linux-x64.tar.gz"
      sha256 "b532428eb95b0ef4af89f23c353ae3ae57690bee7ec6bc5680fc353bf30b1382"
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
