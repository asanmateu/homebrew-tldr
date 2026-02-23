class TldrCli < Formula
  desc "CLI summarization tool optimised for neurodiversity"
  homepage "https://github.com/asanmateu/tldr"
  version "2.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v2.3.0/tldr-darwin-arm64.tar.gz"
      sha256 "63d43611515cdd380cd553de4faaf7a7d61c24ffae6390a74d7ea7d64b982f86"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v2.3.0/tldr-darwin-x64.tar.gz"
      sha256 "c03ce83008791eeba9f579be4636e39c723355bc5a20fea0a0462baaaac74d74"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/asanmateu/tldr/releases/download/v2.3.0/tldr-linux-arm64.tar.gz"
      sha256 "c52ba1bef5a968d126cda6ac38b21c8401931c28239eefbeff7fa4c070d5863c"
    else
      url "https://github.com/asanmateu/tldr/releases/download/v2.3.0/tldr-linux-x64.tar.gz"
      sha256 "0694047af5b460eac1150d49ae784261ac390dae79724b61afa62ffbc67ec627"
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
