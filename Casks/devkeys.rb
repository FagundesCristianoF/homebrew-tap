cask "devkeys" do
  version "1.1.0"
  sha256 :no_check

  # Devkeys is closed-source (private repo) and distributed as source, not a
  # prebuilt binary — pin an exact commit so `brew install` always builds
  # the same code, same as a checksum would for a downloaded artifact.
  url "ssh://git@github.com/FagundesCristianoF/devkeys.git",
      using:    :git,
      tag:      "v#{version}",
      revision: "64b5aa22536065f634f013edb84acb11f4d46e66"
  name "Devkeys"
  desc "Personal credential/password vault"
  homepage "https://github.com/FagundesCristianoF/devkeys"

  depends_on macos: :sonoma

  # Deliberately BEFORE `app` below, against brew style's usual canonical
  # order (style wants preflight_steps after the artifact stanzas) —
  # artifacts install in file declaration order (Cask::Installer#
  # install_artifacts just iterates them in order added), and unlike a
  # normal cask, this preflight step is what PRODUCES the .app that `app`
  # then symlinks in. Reordering to match style would try to symlink an
  # app that doesn't exist yet. `writable_paths: ["."]` grants the
  # sandboxed step write access to the whole checkout (needed for
  # `.build/`); `base: :staged_path` on the command itself is required
  # separately — `run` only defaults `chdir`/`writable_paths` to
  # staged_path, not the command path. The two `~/Library/...` entries
  # are SwiftPM's own manifest/config caches — without them the sandbox
  # denies those writes too (harmless warnings, just no cache reuse
  # across installs) since they fall outside staged_path.
  preflight_steps do
    run "scripts/build-app.sh", base: :staged_path, chdir: ".", writable_paths: [
      ".",
      "~/Library/Caches/org.swift.swiftpm",
      "~/Library/org.swift.swiftpm",
    ]
  end

  app ".build/app/Devkeys.app"

  # The build is only ad-hoc signed (no Apple Developer ID / notarization),
  # so Gatekeeper would otherwise refuse to launch it. Homebrew Cask
  # quarantines every installed app regardless of source; strip that here
  # since we just built it ourselves from source we control. {{appdir}}
  # expands to the cask's target Applications directory.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Devkeys.app"]
  end

  zap trash: [
    "~/Library/Preferences/dev.cristianofagundes.devkeys.plist",
    "~/Library/Saved Application State/dev.cristianofagundes.devkeys.savedState",
  ]
end
