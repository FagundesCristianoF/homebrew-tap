cask "devkeys" do
  version "1.10.0"
  sha256 "a0de9d6dd824915ecf3957c91f075cfa90b3b9d7195c41966bb3c0acd76e90ee"

  # Prebuilt, Developer ID-signed and notarized app, published by CI as a
  # release asset on this (public) tap repo, because the source repo is private.
  url "https://github.com/FagundesCristianoF/homebrew-tap/releases/download/devkeys-v#{version}/Devkeys-#{version}.zip"
  name "Devkeys"
  desc "Personal credential/password vault"
  homepage "https://github.com/FagundesCristianoF/homebrew-tap"

  # The app updates itself through Sparkle (suggested / forced updates).
  auto_updates true

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Devkeys.app"

  zap trash: [
    "~/Library/Preferences/dev.cristianofagundes.devkeys.plist",
    "~/Library/Saved Application State/dev.cristianofagundes.devkeys.savedState",
  ]
end
