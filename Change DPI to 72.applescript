-- Change the DPI of an image
-- 
-- author: Fabrizio Musacchio (https://www.fabriziomusacchio.com)
-- date: Feb 3, 2022

tell application id "DNtp"
	try
		set this_selection to the selection
		if this_selection is {} then error "Please select some images."
		repeat with this_item in this_selection
			if the type of this_item is equal to picture then
				try
					set this_image to the image of this_item
					with timeout of 30 seconds
						tell application "Image Events"
							launch
							set this_file to open file this_image
							set the scalefactor to 72
							set thePathShell to quoted form of this_image
							do shell script "sips -s format jp2 -s formatOptions normal -s dpiHeight " & scalefactor & " -s dpiWidth " & scalefactor & " " & thePathShell
							do shell script "sips -s format jpeg -s formatOptions normal -s dpiHeight " & scalefactor & " -s dpiWidth " & scalefactor & " " & thePathShell
							close this_file
						end tell
					end timeout
					synchronize record this_item
				end try
			end if
			
			--set current_name to the name of this_item
			--set new_item_name to current_name -- & "_fullWidth_" & W & "_" & scalefactor & "_" & R
			--set the name of this_item to new_item_name
			
		end repeat
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell