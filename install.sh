#!/data/data/com.termux/files/usr/bin/sh
# termux-smooth-cursor installer. Does not modify Termux itself.
set -e
REPO="kizuyamaki/termux-smooth-cursor"

echo "[1/3] Installing Python..."
pkg install -y python curl

echo "[2/3] Installing pyte..."
pip install pyte

echo "[3/3] Installing smoothcursor..."
curl -fsSL "https://raw.githubusercontent.com/$REPO/main/smoothcursor" -o "$PREFIX/bin/smoothcursor"
chmod +x "$PREFIX/bin/smoothcursor"

echo
echo "Done. Try it:        smoothcursor"
echo "Auto-start:          smoothcursor autostart on"
echo "Remove everything:   smoothcursor uninstall"
