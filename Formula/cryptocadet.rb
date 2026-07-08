# Homebrew formula for the CryptoCadet CLI.
#
# This file lives in the CLI repo as the source of truth. On each release, copy it to the tap repo
# at:  thetechjd/homebrew-cryptocadet-cli/Formula/cryptocadet.rb  (a plain repo under thetechjd, no
# GitHub org — same as RDK's homebrew-rdk). Homebrew strips the "homebrew-" prefix, so that repo =>
# tap "thetechjd/cryptocadet-cli" and:
#   brew install thetechjd/cryptocadet-cli/cryptocadet
#
# Filled for v0.1.0 (version + sha256s from dist/bin/SHA256SUMS). At the next release, bump the
# version, each url's vX.Y.Z segment, and each sha256 (the release workflow does this automatically).
# The self-contained binary embeds Node 24 — no node, npm, or node_modules dependency here.
class Cryptocadet < Formula
  desc "USDC payment rails for agents on Base"
  homepage "https://cryptocadet.app"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/thetechjd/cryptocadet-cli/releases/download/v0.1.0/cryptocadet-macos-arm64.tar.gz"
      sha256 "70906d93e86010d0ac9845b0ba6b4400068deb3586b481992a068e6b2bb66488"
    end
    on_intel do
      url "https://github.com/thetechjd/cryptocadet-cli/releases/download/v0.1.0/cryptocadet-macos-x64.tar.gz"
      sha256 "62536a065ed41bbf208317149ff530eb350722ca9410f1875ab57b6f3be7f740"
    end
  end

  # Optional: uncomment to also serve `brew install` on Linux (binaries already ship). The
  # documented Linux path is the curl installer; Homebrew-on-Linux users can use this instead.
  # on_linux do
  #   on_arm do
  #     url "https://github.com/thetechjd/cryptocadet-cli/releases/download/v0.1.0/cryptocadet-linux-arm64.tar.gz"
  #     sha256 "cb334c371dc8f87c86fe0e2e4198e2a365412f9a73963192243489759624b241"
  #   end
  #   on_intel do
  #     url "https://github.com/thetechjd/cryptocadet-cli/releases/download/v0.1.0/cryptocadet-linux-x64.tar.gz"
  #     sha256 "450a1069fd0bb7d81672d0ebddb1dd084f44e14c453eecb3a5542328ec9cd1de"
  #   end
  # end

  def install
    bin.install "cryptocadet"
  end

  test do
    assert_match "cryptocadet", shell_output("#{bin}/cryptocadet 2>&1", 1)
  end
end
