#!/bin/bash
# Compiles VaultWidgets, installs it as a LaunchAgent and starts it.
set -euo pipefail

LABEL="com.$(id -un).vaultwidgets"
SRC_DIR="$(cd "$(dirname "$0")" && pwd)"
BIN_DIR="$HOME/.local/bin"
BIN="$BIN_DIR/vault-widgets"
PLIST="$HOME/Library/LaunchAgents/$LABEL.plist"
LOG="$HOME/Library/Logs/vault-widgets.log"
DOMAIN="gui/$(id -u)"

echo "Compiling..."
mkdir -p "$BIN_DIR" "$HOME/Library/LaunchAgents" "$HOME/Library/Logs"
swiftc -O -o "$BIN.new" "$SRC_DIR/VaultWidgets.swift" -framework AppKit
mv -f "$BIN.new" "$BIN"

echo "Writing $PLIST"
cat > "$PLIST" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>$LABEL</string>
    <key>ProgramArguments</key>
    <array>
        <string>$BIN</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
    <key>ThrottleInterval</key>
    <integer>5</integer>
    <key>ProcessType</key>
    <string>Interactive</string>
    <key>LimitLoadToSessionType</key>
    <string>Aqua</string>
    <key>StandardOutPath</key>
    <string>$LOG</string>
    <key>StandardErrorPath</key>
    <string>$LOG</string>
</dict>
</plist>
EOF
plutil -lint "$PLIST" >/dev/null

echo "Loading LaunchAgent..."
launchctl bootout "$DOMAIN/$LABEL" 2>/dev/null || true
# bootout is asynchronous; wait for the old job to disappear before bootstrapping.
for _ in 1 2 3 4 5 6 7 8 9 10; do
    launchctl print "$DOMAIN/$LABEL" >/dev/null 2>&1 || break
    sleep 0.5
done
launchctl enable "$DOMAIN/$LABEL"
launchctl bootstrap "$DOMAIN" "$PLIST"

echo
echo "Installed. Re-run this script after adding a vault in Obsidian to get a tile for it."
echo "To uninstall, run:"
echo "  launchctl bootout $DOMAIN/$LABEL; rm -f \"$PLIST\" \"$BIN\""
