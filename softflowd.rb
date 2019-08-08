class Softflowd < Formula
  desc "flow-based network traffic analyser capable of Cisco NetFlow data export software"
  homepage "https://github.com/irino/softflowd"
  url "https://github.com/irino/softflowd/archive/9925c0e78ea8f746a70afc5185147f1519ad47b8.tar.gz"
  sha256 "ebfa948853a2825e4ab1a1f165da52280cbaa5eb1841aa15cfcd60f7861995fa"
  version "0.9.9.9925c0e"

  depends_on "autoconf" => :build
  depends_on "automake" => :build

  def install
    # install softflowd and softflowctl, create symlink to script in /usr/local/bin
    system "aclocal"
    system "touch", "config.h.in"
    system "rm", "COPYING"
    system "touch", "COPYING"
    system "automake", "--add-missing"
    system "autoreconf"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
    #bin.install "softflowd"
    #bin.install "softflowctl"
  end

  test do
    system "#{bin}/softflowd", "-h"
  end
end
