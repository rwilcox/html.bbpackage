# Select Contents of Current Tag
tell application "BBEdit"
	set beginFindResults to find ">" searching in text 1 of text document 1 options {search mode:grep, starting at top:false, wrap around:false, backwards:true, case sensitive:false, match words:false, extend selection:false} without selecting match
	
	set foundObject to beginFindResults's found object
	set firstCharacter to foundObject's characterOffset
	
	set endFindResults to find "<" searching in text 1 of text document 1 options {search mode:grep, starting at top:false, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false} with selecting match
	
	set foundObject to endFindResults's found object
	
	set lastCharacter to (foundObject's length) + (foundObject's characterOffset)
	
	select (characters (firstCharacter + 1) thru (lastCharacter - 2)) of text of the front window
	
	--	select insertion point after selection
end tell
