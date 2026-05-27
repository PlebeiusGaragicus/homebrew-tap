class Catmd < Formula
  desc "Terminal markdown renderer (cat for .md files)"
  homepage "https://github.com/PlebeiusGaragicus/catmd"
  url "https://github.com/PlebeiusGaragicus/catmd/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "be7f9f0a10dbf4b508b14ace2ba363bd437773b01897d3ae9bb547dced51938f"
  license "MIT"

  depends_on "node@22"

  def install
    system "npm", "ci"
    system "npm", "run", "build"

    libexec.install "dist", "theme.json", "package.json", "node_modules"

    (bin/"catmd").write <<~EOS
      #!/bin/bash
      export PATH="#{Formula["node@22"].opt_bin}:$PATH"
      export CATMD_THEME="${CATMD_THEME:-#{libexec}/theme.json}"
      exec "#{Formula["node@22"].opt_bin}/node" "#{libexec}/dist/cli.js" "$@"
    EOS
  end

  test do
    assert_match "catmd", shell_output("#{bin}/catmd 2>&1", 1)
  end
end
