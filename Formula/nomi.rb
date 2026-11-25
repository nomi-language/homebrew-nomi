# Rendered by scripts/homebrew-formula.sh in github.com/nomi-language/nomi
# from packaging/homebrew/nomi.rb and the checksums of release v0.0.1.
# Do not edit: render it again for the next release.
class Nomi < Formula
  desc "Statically typed, immutable, functional-first programming language"
  homepage "https://nomi-lang.org"
  version "0.0.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/nomi-language/nomi/releases/download/v#{version}/nomi_v#{version}_darwin_arm64.tar.gz"
      sha256 "a1d7afcaffca57b881e48addbab14d0d4a847b83a4b06532c7ac67df7e185109"
    end
    on_intel do
      url "https://github.com/nomi-language/nomi/releases/download/v#{version}/nomi_v#{version}_darwin_amd64.tar.gz"
      sha256 "162a4cdafb4ccf2faa25515b0ee73c82921d68ba4050145f0b16afc0cc4f54b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nomi-language/nomi/releases/download/v#{version}/nomi_v#{version}_linux_arm64.tar.gz"
      sha256 "99ccdc7d1d292348f6b0fcfaed4988e2a8ad03b3456edac15dd8c6505e36ba0e"
    end
    on_intel do
      url "https://github.com/nomi-language/nomi/releases/download/v#{version}/nomi_v#{version}_linux_amd64.tar.gz"
      sha256 "14bad056018dce5b82406580f74ffd2d04f5b5892ee3f791cbb3d120f14fe7bc"
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
