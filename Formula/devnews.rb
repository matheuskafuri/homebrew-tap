class Devnews < Formula
  desc "TUI engineering blog aggregator"
  homepage "https://github.com/matheuskafuri/devnews"
  url "https://github.com/matheuskafuri/devnews/archive/refs/heads/main.tar.gz"
  version "0.1.0"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.commit=#{tap.user}
      -X main.date=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags:)
  end

  test do
    assert_match "devnews", shell_output("#{bin}/devnews version")
  end
end
