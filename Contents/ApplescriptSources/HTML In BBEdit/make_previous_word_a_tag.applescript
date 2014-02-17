
tell application "BBEdit"
	find "^|(?<!\\w[^\\w\\s])\\b(?=\\w)" searching in text of front text window options {search mode:grep, wrap around:false, backwards:true, extend selection:true} with selecting match
	set newTag to selection of front text window
	set selection of front text window to "<" & newTag & ">"
end tell