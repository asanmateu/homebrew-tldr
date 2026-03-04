class TldrCli < Formula
  desc "CLI summarization tool optimised for neurodiversity"
  homepage "https://github.com/asanmateu/tldr"
  version "2.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v2.4.1/tldr-darwin-arm64.tar.gz"
      sha256 "f613d289521aedea7ad80951c6173144d872a654268729fc0fff594a91cdda09"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v2.4.1/tldr-darwin-x64.tar.gz"
      sha256 "3dd8b4ebe4e76f2884034502d6503146345b2b9970c730605ac7c3289d4e517a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v2.4.1/tldr-linux-arm64.tar.gz"
      sha256 "09ea5e76d463719866427dcbe56420b4940df6dfc606f7692c1cddb21ded4775"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v2.4.1/tldr-linux-x64.tar.gz"
      sha256 "4f1c8781085f4414da8fbc9b33931e7181945acff1e67a58a27650c801540b3d"
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
