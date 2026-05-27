class Catmd < Formula
  desc "Terminal markdown renderer (cat for .md files)"
  homepage "https://github.com/PlebeiusGaragicus/catmd"
  license "MIT"
  head "https://github.com/PlebeiusGaragicus/catmd.git", branch: "main"

  depends_on "node@22"

  def install
    system "npm", "ci"
    system "npm", "run", "build"

    libexec.install "dist", "theme.json", "package.json", "node_modules"

    (bin/"catmd").write_env_script <<~EOS, PATH: "#{Formula["node@22"].opt_bin}:$PATH"
      #!/bin/bash
      export CATMD_THEME="${CATMD_THEME:-#{libexec}/theme.json}"
      exec "#{Formula["node@22"].opt_bin}/node" "#{libexec}/dist/cli.js" "$@"
    EOS
  end

  test do
    assert_match "catmd", shell_output("#{bin}/catmd 2>&1", 1)
  end
end
