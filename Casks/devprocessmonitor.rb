cask "devprocessmonitor" do
  version "1.15.1"
  sha256 "6d66d66ccef646a3584927e2313784939218364c3e6adf8cfbe467be56582a76"

  url "https://github.com/FagundesCristianoF/process-monitor/releases/download/v#{version}/ProcessMonitor.zip"
  name "Process Monitor"
  desc "Menu bar app that monitors memory usage for developer processes"
  homepage "https://github.com/FagundesCristianoF/process-monitor"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "ProcessMonitor.app"

  zap trash: [
    "~/Library/Application Support/ProcessMonitor",
    "~/Library/Preferences/com.cristianofagundes.ProcessMonitor.plist",
    "~/Library/Saved Application State/com.cristianofagundes.ProcessMonitor.savedState",
  ]
end
