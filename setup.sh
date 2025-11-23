#!/bin/sh

# make files containing hashes temporarily non-writable so the script won't mess with them 

paths=("$PWD/nixos/desktop/home-manager/qutebrowser.nix" "$PWD/nixos/desktop/home-manager/sway/look.nix" "$PWD/nixos/flake.nix" "$PWD/nixos/flake.lock")

for i in "${!paths[@]}"; do
  chmod -w "${paths[i]}"
done

# finds all instances of my system username and changes to your current one.
find ./nixos -type f -perm -200 -exec sed -i "s/crh/"${whoami}"/g" {} +

for i in "${!paths[@]}"; do
  chmod +w "${paths[i]}"
done

echo -e "Enter your git email:"
read email

echo -e "Now your git username:"
read username

# the following will change my git email and username with yours
find ./nixos -type f -exec sed -i "s/218308804+notawyvern@users.noreply.github.com/${email}/g" {} +
find ./nixos -type f -exec sed -i "s/notawyvern/${username}/g" {} +

echo "Setup complete!"
