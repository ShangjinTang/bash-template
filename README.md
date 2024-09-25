# Bash Template

```bash
git clone https://github.com/ShangjinTang/bash-template.git --depth=1 --recurse-submodules --shallow-submodules
```

## Installation

Use package manager:

```bash
# ArchLinux
sudo pacman -Sy bats
# Ubuntu 24.04
sudo apt-get install bats
```

Use npm:

```bash
npm install -g bats
```

## Run Tests

Run all tests in bats file:

```bash
fd "bats" test --exact-depth=1 | xargs bats
```

Run all tests in a single bats file:

```bash
bats test/strings.bats
```

Run tests contains a pattern:

```bash
bats test/strings.bats -f 'trim'
```

Check all available tests:

```bash
fd ".bats" test --exact-depth=1 | xargs grep "@test" | cut -d '"' -f 2
```
