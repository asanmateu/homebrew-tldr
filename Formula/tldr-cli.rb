class TldrCli < Formula
  desc "CLI summarization tool optimised for neurodiversity"
  homepage "https://github.com/asanmateu/tldr"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v2.0.0/tldr-darwin-arm64.tar.gz"
      sha256 "b881ad83580ae224b1aeca2aeb380ba7f1f06632a6a7f8b3598c77612e13a3b1"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v2.0.0/tldr-darwin-x64.tar.gz"
      sha256 "96da2147f64e5c86e8b526d77233c7b9691a0ace7b233fb057ea4969f9789778"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v2.0.0/tldr-linux-arm64.tar.gz"
      sha256 "568b140136e297df9a67f34b2dd66933cf1cb8e3215c4bda6ddbdd9cc8374a2c"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v2.0.0/tldr-linux-x64.tar.gz"
      sha256 "115f61ea3f1145407dcfdca3084e6108f76e2e4653e5b84d1f1c0b6d9e5c2d2a"
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
