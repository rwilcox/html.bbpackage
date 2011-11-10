tell application "BBEdit"
	set thepath to file of document 1
end tell
set thePathPOSIX to POSIX path of thepath
tell application "Marked"
	
	open thePathPOSIX
	activate
end tell