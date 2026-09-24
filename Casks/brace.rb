cask "brace" do
  version "0.2.13"

  url "https://github.com/FagundesCristianoF/brace-brew/releases/download/v#{version}/Brace-#{version}.dmg"
  sha256 "849873b5b2519bf6515cf724a6fa9d335c471cfb0fb6d00dc668af66742a42e4"

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
