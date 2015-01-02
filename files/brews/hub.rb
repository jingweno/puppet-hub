require 'formula'

class Hub < Formula
  homepage "http://hub.github.com/"
  url "https://github.com/jingweno/puppet-hub/releases/download/2.2.3/hub_2.2.0-rc1_mac_amd64.tar.gz"
  sha1 "029d154ce0f9c4999e4dd6ef23eab5e411370c4f"

  option "without-completions", "Disable bash/zsh completions"

  def install
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
