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
    bin.install "softflowd"
    bin.install "softflowctl"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test softflowd`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end

  #test do
    # test script output
  #  assert_equal %x('#{bin}/hworld'), "Hello world!\n"
  #end
end
