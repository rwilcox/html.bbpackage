# Jump to end of current tag
# Thanks to Roland KŸffner <http://groups.google.com/group/bbedit/msg/fbf8df6412d176f2>
tell application "BBEdit"
	find ">" searching in text 1 of text document 1 options {search mode:grep, starting at top:false, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false} with selecting match
	select insertion point after selection
end tell
