#!/bin/sh

cd home

for f in $(ls -A); do
  echo "$f"
  ln -s "$PWD/$f" "$HOME/$f"
done

cd ..

# Install neovim using pip
pip install neovim

if [ -d "$HOME/.config/nvim" ]; then
  echo "nvim already exists!"
  exit 1
fi

ln -s "$PWD/nvim" "$HOME/.config/nvim"

