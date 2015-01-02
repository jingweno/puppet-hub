require 'formula'

class Hub < Formula
  homepage "http://hub.github.com/"
  url "https://github.com/jingweno/puppet-hub/releases/download/2.2.3/hub_2.2.0-rc1_mac_amd64.tar.gz"
  sha1 "413ce80d32f6313cef010e0edb1e664e1fff7427"

  def install
    bin.install "hub"
    bash_completion.install "etc/hub.bash_completion.sh"
    zsh_completion.install "etc/hub.zsh_completion" => "_hub"
  end

  test do
    HOMEBREW_REPOSITORY.cd do
      assert_equal "bin/brew", shell_output("#{bin}/hub ls-files -- bin").strip
    end
  end
end
