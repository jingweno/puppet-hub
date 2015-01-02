require 'formula'

class Hub < Formula
  homepage "http://hub.github.com/"
  url "https://github.com/jingweno/puppet-hub/releases/download/3.0.0/hub_mac_amd64_2.2.0-rc1.tar.gz"
  sha1 "029d154ce0f9c4999e4dd6ef23eab5e411370c4f"

  def install
    bin.install "hub"
    man1.install Dir["man/*"]
    bash_completion.install "etc/hub.bash_completion.sh"
    zsh_completion.install "etc/hub.zsh_completion" => "_hub"
  end

  test do
    HOMEBREW_REPOSITORY.cd do
      assert_equal "bin/brew", shell_output("#{bin}/hub ls-files -- bin").strip
    end
  end
end
