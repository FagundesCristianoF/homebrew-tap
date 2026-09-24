cask "brace" do
  version "0.2.14"

  url "https://github.com/FagundesCristianoF/brace-brew/releases/download/v#{version}/Brace-#{version}.dmg"
  sha256 "254701ae2ec543448696563231fb5745f0530828e1c0d5ba18a34447cd3b064c"

  name "Brace"
  desc "Native macOS developer toolkit — JSON viewer, editor, and HTTP scanner"
  homepage "https://github.com/FagundesCristianoF/brace-brew"

  depends_on macos: :ventura

  app "Brace.app"

  zap trash: [
    "~/Library/Application Support/com.fagundes.brace",
    "~/Library/Preferences/com.fagundes.brace.plist",
    "~/Library/Saved Application State/com.fagundes.brace.savedState",
  ]
end
