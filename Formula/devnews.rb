class Devnews < Formula
  desc "TUI engineering blog aggregator"
  homepage "https://github.com/matheuskafuri/devnews"
  url "https://github.com/matheuskafuri/devnews/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "77b54c935a03aef6a31ee466a3e334023f7ad190250b70c02cada96fd8f84fe9"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.commit=HEAD
      -X main.date=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags:)
  end

  test do
    assert_match "devnews", shell_output("#{bin}/devnews version")
  end
end
