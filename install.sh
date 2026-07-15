#!/usr/bin/env bash
set -euo pipefail
RICE="$(cd "$(dirname "$0")" && pwd)"
echo "Install rice from: $RICE"

mkdir -p ~/.config/niri/dms ~/.config/DankMaterialShell ~/Pictures/Wallpapers \
  ~/.config/fcitx5/conf ~/.local/share/fcitx5/rime ~/.config/cava/themes

cp -a "$RICE/niri/." ~/.config/niri/
cp -a "$RICE/DankMaterialShell/." ~/.config/DankMaterialShell/
cp -a "$RICE/kitty" "$RICE/fish" "$RICE/fastfetch" "$RICE/matugen" "$RICE/cava" \
  "$RICE/environment.d" "$RICE/gtk-3.0" "$RICE/gtk-4.0" "$RICE/qt5ct" "$RICE/qt6ct" ~/.config/

mkdir -p ~/.config
cp "$RICE/starship/tokyo-night.toml" ~/.config/tokyo-night.toml
ln -sfn ~/.config/tokyo-night.toml ~/.config/starship.toml
ln -sfn dank-colors.css ~/.config/gtk-3.0/gtk.css
cp -f "$RICE/cava/matugen.theme" ~/.config/cava/themes/matugen 2>/dev/null || true
cp -f "$RICE/Xresources" ~/.Xresources

cp "$RICE/fcitx5/config" "$RICE/fcitx5/profile" ~/.config/fcitx5/
cp "$RICE/fcitx5/conf/"* ~/.config/fcitx5/conf/
cp "$RICE/fcitx5/rime/"* ~/.local/share/fcitx5/rime/

if [[ -d "$RICE/wallpapers" ]]; then
  cp -an "$RICE/wallpapers/." ~/Pictures/Wallpapers/ || true
fi

echo "Done. Edit ~/.config/niri/dms/outputs.kdl for your monitors, then re-login."
