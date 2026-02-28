class TldrCli < Formula
  desc "CLI summarization tool optimised for neurodiversity"
  homepage "https://github.com/asanmateu/tldr"
  version "2.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v2.4.0/tldr-darwin-arm64.tar.gz"
      sha256 "452a4663bc8dafda5c33149311798cf3f1dbc6148a866e0d3f252befee67ff7e"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v2.4.0/tldr-darwin-x64.tar.gz"
      sha256 "9def2e8d97f20d3fdcac91d738c7bc84f9f5bbd3fad94e8dfed25c3d81bdab98"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v2.4.0/tldr-linux-arm64.tar.gz"
      sha256 "fcd4a47fa5d654daaf666d82f4b7977a3a2cf840e548b8ea2e9b4d5ee9d5e2ea"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v2.4.0/tldr-linux-x64.tar.gz"
      sha256 "ac74aec6f7e7071a429919411f02aeeb37efcc9556849fc9e27bd7c4233007de"
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
