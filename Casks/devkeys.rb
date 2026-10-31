cask "devkeys" do
  version "1.8.9"
  sha256 "0371ed93497972d096dacee0ca31cb77fc32daeaba46aac79152316905640441"

  # Prebuilt, Developer ID-signed and notarized app, published by CI as a
  # release asset on this (public) tap repo, because the source repo is private.
  url "https://github.com/FagundesCristianoF/homebrew-tap/releases/download/devkeys-v#{version}/Devkeys-#{version}.zip"
  name "Devkeys"
  desc "Personal credential/password vault"
  homepage "https://github.com/FagundesCristianoF/homebrew-tap"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Devkeys.app"

  zap trash: [
    "~/Library/Preferences/dev.cristianofagundes.devkeys.plist",
    "~/Library/Saved Application State/dev.cristianofagundes.devkeys.savedState",
  ]
end
