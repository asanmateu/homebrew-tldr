class TldrCli < Formula
  desc "CLI summarization tool optimised for neurodiversity"
  homepage "https://github.com/asanmateu/tldr"
  version "2.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v2.2.0/tldr-darwin-arm64.tar.gz"
      sha256 "2543b6e6ebc80591d7cdcb4ef189be14d7fa22096a897750b7e8c68e87d7af20"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v2.2.0/tldr-darwin-x64.tar.gz"
      sha256 "f6b197b67b90aef7d27fb9cd3ecac4425cdd5e4b69f8e5b5b788addc772d296e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v2.2.0/tldr-linux-arm64.tar.gz"
      sha256 "b64af869a090eda49b594c4b836c596093482aa4112e345e49dda6cfe5cfa705"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v2.2.0/tldr-linux-x64.tar.gz"
      sha256 "eb4e3a24f1fcc2482fd7e253217bd711b748a1206522b3f5b5416dba8f77912c"
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
