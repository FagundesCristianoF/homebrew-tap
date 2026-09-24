cask "processmonitor" do
  version "1.14.2"
  sha256 "e6dfd03d6c43642ef4774eeec7c69e429356627d77e3181d6f6ed2679c7b87bd"

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
