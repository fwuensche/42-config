# spectacle
cp ~/www/config/Spectacle/Shortcuts.json ~/Library/Application\ Support/Spectacle/Shortcuts.json
pkill Spectacle
open -a Spectacle

# show date on status bar
defaults write com.apple.menuextra.clock "DateFormat" "d MMM w HH:mm" \
  && killall SystemUIServer \
  && sleep 2 && defaults read com.apple.menuextra.clock "DateFormat"

# remap right ctrl to right alt
hidutil property --set '{"UserKeyMapping":
    [{"HIDKeyboardModifierMappingSrc":0x7000000e4,
	      "HIDKeyboardModifierMappingDst":0x7000000e6}]
}'

# clean useless files
# rm -rf ~/Library/*chache_bak*
# rm -rf ~/Library/Suggestions
# rm -rf ~/Library/Caches

# show used disk space
# df -h | grep fwuensch

