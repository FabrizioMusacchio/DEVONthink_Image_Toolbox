-- Auto-rename images and (optionally) annotate them (prior renaming).
-- 
-- author: Fabrizio Musacchio (https://www.fabriziomusacchio.com)
-- date:  Feb 17, 2022


-- Please create an empty DEVONthink document and insert its UUID into the "UUID_of_imager_counter" variable:
property UUID_of_imager_counter : "3E3D7F1F-25A0-4875-B7F1-4D91BE32F24C"

set leading_zeros to 5 as integer
set CaptionCounter to 0 as integer
set RepeatCounter to 1 as integer

set MenuChoices to {"Replace with current image name", "Replace with custom text", "Replace with custom text + increasing number", "Don't replace current annotation", "Remove current annotation and leave empty", "Add current image name", "Add custom text", "Add custom text + increasing number"}
set Choice to choose from list MenuChoices with prompt "The selected images will be renamed according the scheme 'img######'. Please select a method to handle the image annotations:
" with title "Auto-rename images and annotate" default items {"Replace with current image name"}

if Choice is false then
	error number -128
else if text of Choice is {"Replace with custom text"} or text of Choice is {"Replace with custom text + increasing number"} or text of Choice is {"Add custom text"} or text of Choice is {"Add custom text + increasing number"} then
	set CustomAnnotation to the text returned of (display dialog "Please enter a custom image annotation. Will replace existing annotation." default answer "")
end if

tell application id "DNtp"
	try
		set theRecords to every selected record
		if theRecords = {} then error "Error: Please select at least one DEVONthink Markdown file."
		
		
		set ImageCounterFile to get record with uuid UUID_of_imager_counter
		
		activate
		show progress indicator "Renaming images" steps (length of theRecords) with cancel button
		
		repeat with thisRecord in theRecords
			-- Update the progress detail
			step progress indicator "Step " & (RepeatCounter as string) & "/" & (length of theRecords) as string
			if cancelled progress then exit repeat
			set RepeatCounter to RepeatCounter + 1
			
			
			set theType to (type of thisRecord) as string
			if the type of thisRecord is equal to picture then
				--display dialog "Here" buttons {"Okay"} default button "Okay"
				set ImageCounter to the plain text of ImageCounterFile
				if ImageCounter is "" then
					set CounterInit to addLeadingZerosToNumber(1, leading_zeros) of me
					set plain text of ImageCounterFile to CounterInit as string
					set ImageCounterString to CounterInit as string
				else
					set ImageCounterString to addLeadingZerosToNumber(((ImageCounter as integer) + 1), leading_zeros) of me as string
					set plain text of ImageCounterFile to ImageCounterString
				end if
				
				set TheImageName to thisRecord's name
				set ExistingComment to the comment of thisRecord
				
				
				if text of Choice is {"Replace with current image name"} then
					set the comment of thisRecord to TheImageName
				else if text of Choice is {"Replace with custom text"} then
					set the comment of thisRecord to CustomAnnotation
				else if text of Choice is {"Replace with custom text + increasing number"} then
					set the comment of thisRecord to CustomAnnotation & " " & (CaptionCounter as string)
					set CaptionCounter to CaptionCounter + 1
				else if text of Choice is {"Don't replace current annotation"} then
					--set the comment of thisRecord to ExistingComment
					-- do nothing
				else if text of Choice is {"Remove current annotation and leave empty"} then
					set the comment of thisRecord to ""
				else if text of Choice is {"Add current image name"} then
					if ExistingComment is not "" then
						set the comment of thisRecord to ExistingComment & ". " & TheImageName
					else
						set the comment of thisRecord to TheImageName
					end if
				else if text of Choice is {"Add custom text"} then
					--set CustomAnnotation to the text returned of (display dialog "Please enter a custom image annotation. Will be appended to existing annotation." default answer "")
					if ExistingComment is not "" then
						set the comment of thisRecord to ExistingComment & ". " & CustomAnnotation
					else
						set the comment of thisRecord to TheImageName
					end if
				else if text of Choice is {"Add custom text + increasing number"} then
					--set CustomAnnotation to the text returned of (display dialog "Please enter a custom image annotation. Will be appended to existing annotation." default answer "")
					if ExistingComment is not "" then
						set the comment of thisRecord to ExistingComment & ". " & CustomAnnotation & " " & (CaptionCounter as string)
						set CaptionCounter to CaptionCounter + 1
					else
						set the comment of thisRecord to TheImageName
					end if
				end if
				
				try
					set name of thisRecord to "img" & ImageCounterString
				end try
				
			end if
		end repeat
		hide progress indicator
		
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
		return
	end try
end tell




on addLeadingZerosToNumber(theNumber, theMaxLeadingZeroCount)
	-- this function is from https://developer.apple.com/library/archive/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/ManipulateNumbers.html
	
	-- Determine if the number is negative:
	set isNegative to theNumber is less than 0
	
	-- Determine when the maximum number of digits will be reached:
	set theThreshold to (10 ^ theMaxLeadingZeroCount) as integer
	
	-- If the number is shorter than the maximum number of digits:
	if theNumber is less than theThreshold then
		-- If the number is negative, convert it to positive:
		if isNegative = true then set theNumber to -theNumber
		
		-- Add the zeros to the number
		set theLeadingZeros to ""
		set theDigitCount to length of ((theNumber div 1) as string)
		set theCharacterCount to (theMaxLeadingZeroCount + 1) - theDigitCount
		repeat theCharacterCount times
			set theLeadingZeros to (theLeadingZeros & "0") as string
		end repeat
		
		-- Make the number negative, if it was previously negative:
		if isNegative = true then set theLeadingZeros to "-" & theLeadingZeros
		
		-- Return the prefixed number:
		return (theLeadingZeros & (theNumber as text)) as string
		
		-- If the number is greater than or equal to the maximum number of digits
	else
		-- Return the original number:
		return theNumber as text
	end if
end addLeadingZerosToNumber
