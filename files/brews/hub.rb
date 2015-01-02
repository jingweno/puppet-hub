require 'formula'

class Hub < Formula
  homepage "http://hub.github.com/"
  url "https://github.com/github/hub/archive/v2.2.0-rc1.tar.gz"
  sha1 "029d154ce0f9c4999e4dd6ef23eab5e411370c4f"

  head "https://github.com/github/hub.git"

  depends_on "go" => :build

  option "without-completions", "Disable bash/zsh completions"

  def install
    ENV["GIT_DIR"] = cached_download/".git"
    system "script/build"
    bin.install "hub"

    if build.with? "completions"
      bash_completion.install "etc/hub.bash_completion.sh"
      zsh_completion.install "etc/hub.zsh_completion" => "_hub"
    end
  end

  test do
    HOMEBREW_REPOSITORY.cd do
      assert_equal "bin/brew", shell_output("#{bin}/hub ls-files -- bin").strip
    end
  end
end
