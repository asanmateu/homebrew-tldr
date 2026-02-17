class TldrCli < Formula
  desc "CLI summarization tool optimised for neurodiversity"
  homepage "https://github.com/asanmateu/tldr"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v1.1.0/tldr-darwin-arm64.tar.gz"
      sha256 "4413b26b86c7c9814ff426ba86a6f416e95aa6c405dd4f17363a87b8921cee27"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v1.1.0/tldr-darwin-x64.tar.gz"
      sha256 "d3e2de5934f77f2fedcf61fa2699cd8698e5fa4c5135521c4e9ebdbebed36237"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v1.1.0/tldr-linux-arm64.tar.gz"
      sha256 "34d9accc6f97443e6579d8f9d7e2712307fcee0511f61920c9e46125e91616ff"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v1.1.0/tldr-linux-x64.tar.gz"
      sha256 "72d197de29a2c76217fac1705119cf3e331cbc8b47549c240192069401c9e2ea"
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
