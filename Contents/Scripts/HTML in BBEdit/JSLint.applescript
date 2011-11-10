
-- Based on John Gruber's PHP Syntax Checking script
-- from Daring Fireball
--  http://daringfireball.net/2003/12/php_syntax_checking_in_bbedit

-- Requires JavaScript Lint
-- http://www.javascriptlint.com/
-- Assumes it is installed at /usr/local/bin/jsl

-- requires OS >=10.4
-- Dual-licensed under the BSD or MIT licenses.
-- http://www.schmoyer.com/code/js_lint/license.phtml


on run
	-- The run handler is called when the script is invoked normally,
	-- such as from BBEdit's Scripts menu.
	JSLint()
end run



on menuselect()
	-- The menuselect() handler gets called when the script is invoked
	-- by BBEdit as a menu script. Save this script, or an alias to it,
	-- as "JS Lint Document" in the "Menu Scripts" folder in your
	-- "BBEdit Support" folder.
	JSLint()
end menuselect

on JSLint()
	
	-- Set any specific JSL settings here
	--  Make sure -process is LAST
	-- More info: http://www.javascriptlint.com/docs/index.htm
	set jsl to Â
		"  /opt/local/bin/jsl  " & Â
		"-nologo -output-format \"__LINE__|__ERROR__\"" & Â
		"  -context -nosummary -nofilelisting " & Â
		" -process   " as text
	
	tell application "BBEdit"
		try
			set w to text window 1
		on error
			beep
			return
		end try
		set the_filename to name of (document of w)
		
		try
			set current_file to file of text window 1
		on error
			display alert "Please save this file first."
			return
		end try
		
		
		if (modified of (document of w)) then
			-- unsaved changes, write a temp file   
			set parent_folder to (path to temporary items folder)
			set temp_file to (parent_folder as string) & the_filename
			if not (my WriteUnixTextFile(temp_file, text of w)) then
				-- End script, because an error occured writing the temp file
				return
			end if
			
		else
			-- use the real file on disk
			tell application "Finder"
				set parent_folder to (container of (file of w as alias)) Â
					as alias
			end tell
		end if
	end tell
	
	set the_command to "cd " & quoted form of POSIX path of parent_folder Â
		& ";" & jsl & (quoted form of (the_filename))
	set no_errors to true
	try
		-- jsl will have an exit status that is not zero 
		-- unless there are no Warnings or errors
		set the_result to do shell script the_command
		
	on error err_text
		set no_errors to false
		-- the actual error information is stored in err_text
		-- since exit status is not 0
		set the_result to err_text
	end try
	
	
	tell application "BBEdit"
		if no_errors then
			-- requires OS >=10.4
			display alert "JSLint Results" message Â
				"No errors or warnings found in " & the_filename
		else
			
			set error_list to {}
			
			repeat with the_line in (every paragraph of the_result)
				
				if (the_line as text) is not equal to "" then
					set old_delims to AppleScript's text item delimiters
					set AppleScript's text item delimiters to "|"
					set err_description to text item 2 of the_line
					set line_num to text item 1 of the_line as integer
					set AppleScript's text item delimiters to old_delims
					if err_description contains "error" then
						set err_kind to error_kind
					else
						set err_kind to warning_kind
					end if
					set err_list_item to Â
						{result_kind:Â
							err_kind, result_file:Â
							current_file, result_line:Â
							line_num, message:Â
							err_description as text}
					
					copy err_list_item to end of error_list
				end if
				
				
			end repeat
			make new results browser with data error_list Â
				with properties {name:"JSLint Results for " & the_filename}
			
		end if
		
	end tell
end JSLint


on WriteUnixTextFile(file_name, file_contents)
	-- Write a text file with unix-style line endings.
	-- Input:
	--    file_name - the HFS-style path for the file to write
	--    file_contents - the text to write to a file
	-- Returns: true for success, false for failure
	try
		set file_ref to Â
			open for access file file_name with write permission
		set eof of file_ref to 0
		
		-- change the text of file_contents to unix line breaks
		set old_delims to AppleScript's text item delimiters
		set AppleScript's text item delimiters to return
		set text_list to every text item of file_contents as list
		set AppleScript's text item delimiters to (ASCII character 10)
		set file_contents to (text_list as string)
		set AppleScript's text item delimiters to old_delims
		
		write file_contents to file_ref starting at eof
		close access file_ref
		return true
	on error err_msg
		try
			close access file file_ref
		end try
		display dialog err_msg with icon stop buttons {"OK"} Â
			default button 1
		return false
	end try
end WriteUnixTextFile