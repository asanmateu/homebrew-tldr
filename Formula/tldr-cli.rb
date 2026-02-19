class TldrCli < Formula
  desc "CLI summarization tool optimised for neurodiversity"
  homepage "https://github.com/asanmateu/tldr"
  version "2.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v2.0.1/tldr-darwin-arm64.tar.gz"
      sha256 "aecd2fd78a02c23869651bdaf17907b2e7f72253ab3f5d84dc4fce75252f6414"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v2.0.1/tldr-darwin-x64.tar.gz"
      sha256 "1eef35a143f21fe26a31bc10651c20198d733a22b5bbebab65a7960230e93031"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v2.0.1/tldr-linux-arm64.tar.gz"
      sha256 "95f3d09c030f0918cc3ac33a44af6a4917d0d0e20ff7487ca8c32264b333c3e9"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v2.0.1/tldr-linux-x64.tar.gz"
      sha256 "3970b273f9de936a19432aa7d9f5b6dfe61328759766ba2ac6f8a626023247b8"
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
