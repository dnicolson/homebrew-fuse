require_relative "../require/macfuse"

class Archivemount < Formula
  desc "File system for accessing archives using libarchive"
  homepage "https://www.cybernoia.de/software/archivemount.html"
  url "https://www.cybernoia.de/software/archivemount/archivemount-0.9.1.tar.gz"
  sha256 "c529b981cacb19541b48ddafdafb2ede47a40fcaf16c677c1e2cd198b159c5b3"

  bottle do
    root_url "https://github.com/gromgit/homebrew-fuse/releases/download/archivemount-0.9.1"
    sha256 cellar: :any, big_sur:  "c6f48f507e80e6b0686bcf675e875046f66580b5d940171e4fa0a3eb9c9db563"
    sha256 cellar: :any, catalina: "b0b8165a5e48a06374be4bdeeec67bdbf0f0181132af6679ccdc8451c2de55f5"
    sha256 cellar: :any, mojave:   "b7d12374987608fe9e1bc96d8e61de5de960d750ae0bdcb6d7f6e6191cc26d35"
  end

  depends_on "pkg-config" => :build
  depends_on "libarchive"
  depends_on MacfuseRequirement
  depends_on :macos

  def install
    ENV.append_to_cflags "-I/usr/local/include/osxfuse"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"

    system "make", "install"
  end

  test do
    system bin/"archivemount", "--version"
  end
end