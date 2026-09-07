# homebrew-tap

Personal Homebrew tap.

```
brew tap FagundesCristianoF/tap
brew install --cask devkeys
```

## Casks

- **devkeys** — personal credential/password vault for macOS. Private
  repo, builds from source (SwiftPM) on install — see `Casks/devkeys.rb`.
  Needs Xcode Command Line Tools (`swift`) and SSH access to
  `FagundesCristianoF/devkeys` (private) to build.

## Releasing a new devkeys version

From the `devkeys` repo:

```
scripts/release.sh <new-version>   # e.g. 1.1.0
```

That tags and pushes `v<version>`. Then here:

```
scripts/bump-devkeys.sh <new-version>
git add -A && git commit -m "devkeys <new-version>" && git push
```

`brew upgrade --cask devkeys` (after `brew update`) then rebuilds it.
