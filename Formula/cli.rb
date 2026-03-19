class Cli < Formula
  desc "Remote terminal accessible from your phone via QR code"
  homepage "https://github.com/rafgirao/remote-terminal"
  url "https://github.com/rafgirao/remote-terminal/releases/download/v0.15.0/remote-terminal-0.15.0.tar.gz"
  sha256 "1b18240cce814a873e9bd96d793f632ca0d81324e63f76951159a72424eebefa"
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
