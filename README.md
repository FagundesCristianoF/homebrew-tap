# homebrew-tap

Personal Homebrew tap.

```
brew tap FagundesCristianoF/tap
brew install --cask brace
brew install --cask devprocessmonitor
brew install --cask devkeys
```

## Casks

- **brace** — native macOS JSON viewer, editor and HTTP scanner. Notarized DMG from [brace-brew](https://github.com/FagundesCristianoF/brace-brew/releases).
- **devprocessmonitor** — menu bar app that monitors memory usage for developer processes. Notarized zip from [process-monitor](https://github.com/FagundesCristianoF/process-monitor/releases).
- **devkeys** — personal credential/password vault. Private repo, builds from source (SwiftPM) on install; needs Xcode Command Line Tools and SSH access to `FagundesCristianoF/devkeys`.

## Releasing

Casks are updated automatically. Each app's `release.yml` pipeline runs when its `Info.plist` version changes on the default branch, and commits the new `version` / `sha256` (or `revision` for devkeys) here. Nothing to run by hand.

## Migrating from the old taps

`FagundesCristianoF/brace` and `FagundesCristianoF/processmonitor` were merged into this tap. Homebrew redirects installs automatically; to clean up:

```
brew untap FagundesCristianoF/brace FagundesCristianoF/processmonitor
brew tap FagundesCristianoF/tap
```
