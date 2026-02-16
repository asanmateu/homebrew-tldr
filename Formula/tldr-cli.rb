class TldrCli < Formula
  desc "CLI summarization tool optimized for dyslexia and ADHD"
  homepage "https://github.com/asanmateu/tldr"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v0.8.0/tldr-darwin-arm64.tar.gz"
      sha256 "b726b7f6fb4e56e22a75d1cbaa59db947396a7e4b609df37ce9feed5587ff306"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v0.8.0/tldr-darwin-x64.tar.gz"
      sha256 "aa150130c28e31d4a96ccb178479449729095b711a2d6f1f1637d97f586a7a46"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v0.8.0/tldr-linux-arm64.tar.gz"
      sha256 "b27d8acc8e96085274d805d2a9a88373a92c3f4fae9099ef2d3d0fc94b89db14"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v0.8.0/tldr-linux-x64.tar.gz"
      sha256 "29d6135f63194eef0637ad35c60c899e81c0fd3e98836124039adea18537e757"
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
