# My AstroNvim Configuration

**NOTE:** This is for AstroNvim v4+

A template for getting started with [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## Clone the repository

```shell
git clone --depth=1 https://github.com/nawfalmrouyan/astronvim ~/.config/astronvim
```

## Start Neovim using the script below

```shell
export NVIM_APPNAME="${NVIM_APPNAME:-"astronvim"}"

export ASTRONVIM_RUNTIME_DIR="${ASTRONVIM_RUNTIME_DIR:-"$HOME/.local/share/astronvim"}"
export ASTRONVIM_CONFIG_DIR="${ASTRONVIM_CONFIG_DIR:-"$HOME/.config/astronvim"}"
export ASTRONVIM_CACHE_DIR="${ASTRONVIM_CACHE_DIR:-"$HOME/.cache/astronvim"}"

export ASTRONVIM_BASE_DIR="${ASTRONVIM_BASE_DIR:-"$HOME/.config/astronvim"}"

# Check if nvim is installed
if ! command -v nvim &>/dev/null; then
  echo "Error: nvim is not installed."
  exit 1
fi

exec -a "$NVIM_APPNAME" nvim -u "$ASTRONVIM_BASE_DIR/init.lua" "$@"
```
