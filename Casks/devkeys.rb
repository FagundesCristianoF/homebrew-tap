cask "devkeys" do
  version "1.8.8"
  sha256 "9469b083d91c8504401c2d5ac4c0db2fdfa0d6eb6dc6d00f72ceb9effc1ae004"

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
