cask "brace" do
  version "0.2.15"
  sha256 "02536ce7f1bf1f7de5966d66675a50ad75af2bc8635f05e21d4e9dda0cad0c3e"

  url "https://github.com/FagundesCristianoF/brace-brew/releases/download/v#{version}/Brace-#{version}.dmg"

  name "Brace"
  desc "Developer toolkit with JSON viewer, editor and HTTP scanner"
  homepage "https://github.com/FagundesCristianoF/brace-brew"

  depends_on macos: :ventura

  app "Brace.app"

  zap trash: [
    "~/Library/Application Support/com.fagundes.brace",
    "~/Library/Preferences/com.fagundes.brace.plist",
    "~/Library/Saved Application State/com.fagundes.brace.savedState",
  ]
end
