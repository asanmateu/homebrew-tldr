class TldrCli < Formula
  desc "CLI summarization tool optimised for neurodiversity"
  homepage "https://github.com/asanmateu/tldr"
  version "2.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v2.5.0/tldr-darwin-arm64.tar.gz"
      sha256 "fe43e0d0eb1e42d45d97e736589133ce197abe1476126d4787b820d5375e1135"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v2.5.0/tldr-darwin-x64.tar.gz"
      sha256 "d40f605447a753698c6f367ecda9b63d26ff7dc5da545fbf46611404861c9bb0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v2.5.0/tldr-linux-arm64.tar.gz"
      sha256 "6bc25abafc5dd3d3793be20e6a1104ec8f92897d7949f8d200f497ae8eca5b4d"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v2.5.0/tldr-linux-x64.tar.gz"
      sha256 "e55fa2c61428c5f6293db8e02085aa2f08d71135a63cf2d345cda65ebf2d1fc8"
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
