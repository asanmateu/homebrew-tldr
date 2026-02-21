class TldrCli < Formula
  desc "CLI summarization tool optimised for neurodiversity"
  homepage "https://github.com/asanmateu/tldr"
  version "2.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v2.1.0/tldr-darwin-arm64.tar.gz"
      sha256 "5fe8d46d12b81cca78bdbfa31d4df8ac93afc529348fe449a688de5f0d1918ac"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v2.1.0/tldr-darwin-x64.tar.gz"
      sha256 "3f8a8b37d1b90ac35947483eeb7603852ad8d1b4e46e61448a288ba40c1a89a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v2.1.0/tldr-linux-arm64.tar.gz"
      sha256 "f33d7ad2cc5b609370808fc3b500b17c915ee66d2e01a5a79a892ef161cbebf5"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v2.1.0/tldr-linux-x64.tar.gz"
      sha256 "1735351b157a0414f2714e61665778d76c6dd48a0ea1f97333225193179429de"
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
