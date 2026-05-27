# homebrew-tap

Third-party [Homebrew tap](https://docs.brew.sh/Taps) for formulae maintained by [PlebeiusGaragicus](https://github.com/PlebeiusGaragicus). Install these packages with `brew` without waiting for them to land in [homebrew-core](https://github.com/Homebrew/homebrew-core).

## What is a tap?

Homebrew’s default catalog is **core**. A **tap** is an extra Git repository of install recipes (formulae). Adding a tap tells Homebrew where to find those recipes; `brew install` then works like for any other package.

This repository follows the usual tap layout:

```text
homebrew-tap/
├── Formula/          # one .rb file per installable tool
│   └── catmd.rb
└── README.md
```

After you tap it once, Homebrew checks this repo when you run `brew update`, same as core.

## Available formulae

| Formula | Description |
| ------- | ----------- |
| [catmd](https://github.com/PlebeiusGaragicus/catmd) | Terminal markdown renderer (`cat` for `.md` files) |

More formulae can be added under `Formula/` as needed.

## Install

**Option A — tap, then install** (good if you will install several packages from here):

```bash
brew tap PlebeiusGaragicus/tap
brew install catmd --HEAD
```

**Option B — one command** (Homebrew adds the tap automatically):

```bash
brew install PlebeiusGaragicus/tap/catmd --HEAD
```

`catmd` is built from the latest `main` branch (`--HEAD`). Drop `--HEAD` once the formula pins a release URL and checksum.

## Update

```bash
brew update
brew reinstall catmd --HEAD
```

## Uninstall

```bash
brew uninstall catmd
brew untap PlebeiusGaragicus/tap   # optional, if you no longer need this tap
```
