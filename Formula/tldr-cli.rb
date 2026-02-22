class TldrCli < Formula
  desc "CLI summarization tool optimised for neurodiversity"
  homepage "https://github.com/asanmateu/tldr"
  version "2.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v2.2.1/tldr-darwin-arm64.tar.gz"
      sha256 "f9bfe2f5043b39d9fb41564751936eee8e6eb26d780564558dba8eb7cf598ff2"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v2.2.1/tldr-darwin-x64.tar.gz"
      sha256 "4150090ecf5a3e56fe94e01688a3b207d72c51fa955839d27a089701fcb12672"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v2.2.1/tldr-linux-arm64.tar.gz"
      sha256 "d4cbfb616439330ea3a27888b88d84a433accea63b27e2b8b283a5bb2aabbd94"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v2.2.1/tldr-linux-x64.tar.gz"
      sha256 "0eddf950b1769eb29b096971be2082c50bd1c8bd273aba5dd69e2a5de26668c4"
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
