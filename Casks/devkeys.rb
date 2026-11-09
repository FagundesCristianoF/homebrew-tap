cask "devkeys" do
  version "1.9.0"
  sha256 "1fbc9df52ddf864b34d2a0a6209e41403bd39b68581c3c40dbc95de24389de66"

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
