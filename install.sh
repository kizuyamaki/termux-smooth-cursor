#!/data/data/com.termux/files/usr/bin/sh
# termux-smooth-cursor installer. Does not modify Termux itself.
set -e
REPO="kizuyamaki/termux-smooth-cursor"

echo "[1/4] Installing Python..."
pkg install -y python curl

echo "[2/4] Installing pyte..."
pip install pyte

echo "[3/4] Installing smoothcursor..."
curl -fsSL "https://raw.githubusercontent.com/$REPO/main/smoothcursor" -o "$PREFIX/bin/smoothcursor"
chmod +x "$PREFIX/bin/smoothcursor"

echo "[+] Turning on auto-start for new sessions..."
smoothcursor autostart on

echo
echo "Done. Open a new Termux session (or run: smoothcursor)."
echo "Turn off auto-start: smoothcursor autostart off"
echo "Remove everything:   smoothcursor uninstall"
