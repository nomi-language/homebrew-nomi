# Rendered by scripts/homebrew-formula.sh in github.com/nomi-language/nomi
# from packaging/homebrew/nomi.rb and the checksums of release v0.0.2.
# Do not edit: render it again for the next release.
class Nomi < Formula
  desc "Statically typed, immutable, functional-first programming language"
  homepage "https://nomi-lang.org"
  version "0.0.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/nomi-language/nomi/releases/download/v#{version}/nomi_v#{version}_darwin_arm64.tar.gz"
      sha256 "6aaa4cacc1f9bd9d296f43a3f6d945102d41d71e11d8e9bbe791b2e1ef011d5b"
    end
    on_intel do
      url "https://github.com/nomi-language/nomi/releases/download/v#{version}/nomi_v#{version}_darwin_amd64.tar.gz"
      sha256 "41771f2748e03a9bda6d8be461390d60002b79d731d3d3c159a7752e75692f33"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nomi-language/nomi/releases/download/v#{version}/nomi_v#{version}_linux_arm64.tar.gz"
      sha256 "5b3eb671bbf76fcec61ba22e771404bd7b194d647e322bc8ed88bfd8f7bc150c"
    end
    on_intel do
      url "https://github.com/nomi-language/nomi/releases/download/v#{version}/nomi_v#{version}_linux_amd64.tar.gz"
      sha256 "92b306a62a443dd4a5791b36584738657fdd630320a3f7eac50001881efbb1d2"
    end
  end

  def install
    bin.install "nomi"
  end

  test do
    assert_match "nomi v#{version} ", shell_output("#{bin}/nomi --version")
    (testpath/"hello.nomi").write <<~NOMI
      import std::io

      fn main()
          io.print("Hello, Nomi!")
      end
    NOMI
    assert_equal "Hello, Nomi!\n", shell_output("#{bin}/nomi run #{testpath}/hello.nomi")
  end
end
