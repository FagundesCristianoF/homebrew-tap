cask "devkeys" do
  version "1.0.0"
  sha256 :no_check

  # Devkeys is closed-source (private repo) and distributed as source, not a
  # prebuilt binary — pin an exact commit so `brew install` always builds
  # the same code, same as a checksum would for a downloaded artifact.
  url "git@github.com:FagundesCristianoF/devkeys.git",
      using:    :git,
      tag:      "v#{version}",
      revision: "33f0548f2f8d4ff527e7d599ad646f612a3a7ef2"

  name "Devkeys"
  desc "Personal credential/password vault for macOS"
  homepage "https://github.com/FagundesCristianoF/devkeys"

  depends_on macos: ">= :sonoma"

  # No prebuilt artifact to stage — build it from the tagged source SwiftPM
  # just checked out into the staging directory, the same way
  # scripts/build-app.sh does for local dev installs.
  preflight do
    system_command "/usr/bin/swift",
                    args: ["build", "-c", "release"],
                    chdir: staged_path
    system_command "#{staged_path}/scripts/build-app.sh",
                    chdir: staged_path
  end

  app ".build/app/Devkeys.app"

  # The build is only ad-hoc signed (no Apple Developer ID / notarization),
  # so Gatekeeper would otherwise refuse to launch it. Homebrew Cask
  # quarantines every installed app regardless of source; strip that here
  # since we just built it ourselves from source we control.
  postflight do
    system_command "/usr/bin/xattr",
                    args: ["-dr", "com.apple.quarantine", "#{appdir}/Devkeys.app"]
  end

  zap trash: [
    "~/Library/Preferences/dev.cristianofagundes.devkeys.plist",
    "~/Library/Saved Application State/dev.cristianofagundes.devkeys.savedState",
  ]
end
