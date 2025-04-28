class Bunster < Formula
  desc "Compile shell scripts to static binaries"
  homepage "https://bunster.netlify.app"
  url "https://github.com/yassinebenaid/bunster/releases/download/v0.12.1/bunster_darwin-amd64.tar.gz"
  sha256 "703e2268290f6e8b3f715b5bbc88d9dadb13c33b775a8a47374f2a93d37687af"
  version "0.12.1"
  license "MIT" # Update if your license is different

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yassinebenaid/bunster/releases/download/v0.12.1/bunster_darwin-arm64.tar.gz"
      sha256 "2a7c418c55dbb45dc3efe322e459368385cf6e8e632457c43a20f26e0816cbf2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/yassinebenaid/bunster/releases/download/v0.12.1/bunster_linux-arm64.tar.gz"
      sha256 "b06706dc37a751dfb13137a36a258e1f4677d97ba9e6f57854acedeb629afb38"
    elsif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/yassinebenaid/bunster/releases/download/v0.12.1/bunster_linux-amd64.tar.gz"
        sha256 "03624ad1726c1aeaa0e9426e6b53cea8d30076f3cdd0cc074c7335606d9a693d"
      else
        url "https://github.com/yassinebenaid/bunster/releases/download/v0.12.1/bunster_linux-386.tar.gz"
        sha256 "c56cd8cc43f0f27129794796930af2f91008e9eee67f00cb90fca1a4899ec58e"
      end
    end
  end

  def install
    bin.install "bunster"
  end

  test do
    system "#{bin}/bunster", "--help"
  end
end
