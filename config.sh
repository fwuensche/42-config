# spectacle
echo "Download Spectacle shortcuts file..."
curl -sO https://raw.githubusercontent.com/fwuensche/42-config/master/Spectacle/Shortcuts.json
echo "Moving it to Application folder..."
mv Shortcuts.json ~/Library/Application\ Support/Spectacle/Shortcuts.json
echo "Restarting Spectacle..."
pkill Spectacle
open -a Spectacle

# show date on status bar
echo "Add date to status bar..."
defaults write com.apple.menuextra.clock "DateFormat" "d MMM w HH:mm" \
  && killall SystemUIServer \
  && sleep 2 && defaults read com.apple.menuextra.clock "DateFormat" >/dev/null

# remap right ctrl to right alt
echo "Remap right-ctrl to right-alt..."
hidutil property --set '{"UserKeyMapping":
    [{"HIDKeyboardModifierMappingSrc":0x7000000e4,
	      "HIDKeyboardModifierMappingDst":0x7000000e6}]
}' >/dev/null

# auto hide dock faster
echo "Auto-hide Dock and remove its slow animation..."
defaults write com.apple.dock autohide -bool true && \
	defaults write com.apple.dock autohide-delay -float 0 && \
	defaults write com.apple.dock autohide-time-modifier -float 0 && \
	killall Dock

# clean useless files
# rm -rf ~/Library/*chache_bak*
# rm -rf ~/Library/Suggestions
# rm -rf ~/Library/Caches

# show used disk space
echo; df -h | tail -n 1 | awk '{print "You are currently using "$5" of disk space"}'

