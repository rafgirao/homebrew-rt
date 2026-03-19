class Cli < Formula
  desc "Remote terminal accessible from your phone via QR code"
  homepage "https://github.com/rafgirao/remote-terminal"
  url "https://github.com/rafgirao/remote-terminal/releases/download/v0.12.0/remote-terminal-0.12.0.tar.gz"
  sha256 "9aa5cafe82bb80349a38506182403646761d97797c5d253835038dd55e8408f3"
  license "MIT"

  depends_on "tmux"
  depends_on "ttyd"
  depends_on "caddy"
  depends_on "cloudflared"
  depends_on "qrencode"
  depends_on "python@3"
  depends_on :macos

  def install
    bin.install "bin/rt"
    (share/"rt").install Dir["share/rt/*"]
  end

  def caveats
    <<~EOS
      Start a session with:
        rt
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/rt help")
  end
end
