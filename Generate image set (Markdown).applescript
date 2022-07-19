-- Generate a set of (Markdown) image links, that can be inserted into Markdown files. 
-- The set will be saved into the clipboard and can be pasted into the desired Markdown
-- document.
--
-- author: Fabrizio Musacchio (https://www.fabriziomusacchio.com)
-- date: Feb 13, 2022


set GridChoices to {"grid 1 (100% width) + caption", "grid 1 (100% width)", "grid 2 (50% width) + caption", "grid 2 (50% width)", "grid 3 (33% width) + caption", "grid 3 (33% width)", "enter individual width + caption", "enter individual width"}
set TheGridChoice to choose from list GridChoices with prompt "Generating an image-set of currently selected images. The set will be copied to the clipboard and can be inserted into a Markdown file. 

Please select a grid size, i.e., how many images to show per row. The '+ caption' option extracts the image annotations and adds them as captions under each image (for image widths >= 25%)." default items {"grid 1 (100% width) + caption"} with title "Choose image width"


if TheGridChoice is false then
	error number -128
else if text of TheGridChoice is {"enter individual width"} then
	set dialogResult to display dialog "Please enter an image width (in %)" buttons {"Cancel", "OK"} default button "OK" cancel button "Cancel" default answer ("24") with title "Choose image width"
	set InsertCaption to false --false true
	set TheWidth to text returned of dialogResult
	if dialogResult is false then error number -128
else if text of TheGridChoice is {"enter individual width + caption"} then
	set dialogResult to display dialog Â
		"Please enter an image width (in %)" buttons {"Cancel", "OK"} default button "OK" cancel button "Cancel" default answer ("24") with title "Choose image width"
	set InsertCaption to true --false true
	set TheWidth to text returned of dialogResult
	if dialogResult is false then error number -128
else if text of TheGridChoice is {"grid 1 (100% width) + caption"} then
	set InsertCaption to true --false true
	set TheWidth to 100
else if text of TheGridChoice is {"grid 1 (100% width)"} then
	set InsertCaption to false --false true
	set TheWidth to 100
else if text of TheGridChoice is {"grid 2 (50% width) + caption"} then
	set InsertCaption to true --false true
	set TheWidth to 49
else if text of TheGridChoice is {"grid 2 (50% width)"} then
	set InsertCaption to false --false true
	set TheWidth to 49
else if text of TheGridChoice is {"grid 3 (33% width) + caption"} then
	set InsertCaption to true --false true
	set TheWidth to 32
else if text of TheGridChoice is {"grid 3 (33% width)"} then
	set InsertCaption to false --false true
	set TheWidth to 32
end if


tell application id "DNtp"
	try
		set theRecords to selected records
		if theRecords = {} then error "Error: Please select at least one image file."
		
		set NumberOfRecords to count of theRecords
		set TheFullImageLink to "<center>

"
		set TheImageLink to ""
		set RunCounter to 0
		repeat with thisRecord in theRecords
			if the type of thisRecord is equal to picture then
				set RunCounter to RunCounter + 1
				
				try
					set TheCaption to the comment of thisRecord
				on error
					set TheCaption to " "
				end try
				set TheImageName to thisRecord's name
				set TheImageURL to "x-devonthink-item://" & thisRecord's uuid
				
				if TheWidth is greater than 49 then
					set TheGridSize to 1
				else if TheWidth ² 49 and TheWidth > 32 then
					set TheGridSize to 2
				else if TheWidth ² 32 and TheWidth > 25 then
					set TheGridSize to 3
				else
					set TheGridSize to 999
				end if
				
				if TheGridSize is equal to 1 then
					-- the 100% width case:
					if InsertCaption then
						set TheImageLink to TheImageLink & TheFullImageLink & "[![" & TheImageName & "]]

" & TheCaption & "	
</center>

[" & TheImageName & "]: " & TheImageURL & " style=\"width:" & TheWidth & "%;\"
"
					else
						set TheImageLink to TheImageLink & TheFullImageLink & "[![" & TheImageName & "]]
</center>

[" & TheImageName & "]: " & TheImageURL & " style=\"width:" & TheWidth & "%;\"
"
					end if
				else if TheGridSize is not 999 then
					-- the 49%-32% and 32%-24% width cases:
					if InsertCaption then
						if RunCounter mod TheGridSize is not 0 then
							if RunCounter mod TheGridSize is 1 then
								set TheImageLink to TheImageLink & TheFullImageLink & "[![" & TheImageName & "]] "
								set TheCaptionTmp to "

**Left**: " & TheCaption
								set TheReferences to "[" & TheImageName & "]: " & TheImageURL & " style=\"width:" & TheWidth & "%;\"
"
							else
								set TheImageLink to TheImageLink & "[![" & TheImageName & "]] "
								set TheReferences to TheReferences & "[" & TheImageName & "]: " & TheImageURL & " style=\"width:" & TheWidth & "%;\"
"
								if TheGridSize is 3 then
									set TheCaptionTmp to TheCaptionTmp & " Ð **Middle**: " & TheCaption
								end if
							end if
						else
							set TheImageLink to TheImageLink & "[![" & TheImageName & "]] "
							set TheReferences to TheReferences & "[" & TheImageName & "]: " & TheImageURL & " style=\"width:" & TheWidth & "%;\"
"
							set TheCaptionTmp to TheCaptionTmp & " Ð **Right**: " & TheCaption
							set TheImageLink to TheImageLink & TheCaptionTmp & "
</center>

" & TheReferences
						end if
						if RunCounter = NumberOfRecords and RunCounter mod TheGridSize is not 0 then
							set TheImageLink to TheImageLink & TheCaptionTmp
							
							--							set TheImageLink to TheImageLink & TheCaptionTmp & "
							--</center>
							--
							--" & TheReferences
							
						end if
					else
						if RunCounter mod TheGridSize is 1 then
							set TheImageLink to TheImageLink & TheFullImageLink & "[![" & TheImageName & "]] "
							set TheReferences to "[" & TheImageName & "]: " & TheImageURL & " style=\"width:" & TheWidth & "%;\"
"
						else if RunCounter mod TheGridSize is 2 then
							set TheImageLink to TheImageLink & "[![" & TheImageName & "]] "
							set TheReferences to TheReferences & "[" & TheImageName & "]: " & TheImageURL & " style=\"width:" & TheWidth & "%;\"
"
						else
							set TheImageLink to TheImageLink & "[![" & TheImageName & "]]"
							set TheReferences to TheReferences & "[" & TheImageName & "]: " & TheImageURL & " style=\"width:" & TheWidth & "%;\"
"
							set TheImageLink to TheImageLink & "
</center>

" & TheReferences
						end if
					end if
					
					if RunCounter = NumberOfRecords and RunCounter mod TheGridSize is not 0 then
						set TheImageLink to TheImageLink & "
</center> 

" & TheReferences
					end if
					
				else
					-- any other case (i.e., grid-widths smaller than 24%):
					-- at the moment w/o a caption option. 
					if RunCounter is 1 then
						set TheImageLink to TheImageLink & TheFullImageLink & "[![" & TheImageName & "]]"
						set TheReferences to "[" & TheImageName & "]: " & TheImageURL & " style=\"width:" & TheWidth & "%;\"
"
						if InsertCaption then
							set TheCaptionTmp to "

1\\. " & TheCaption
						end if
					else
						set TheImageLink to TheImageLink & "[![" & TheImageName & "]]"
						set TheReferences to TheReferences & "[" & TheImageName & "]: " & TheImageURL & " style=\"width:" & TheWidth & "%;\"
"
						if InsertCaption then
							set TheCaptionTmp to TheCaptionTmp & " Ð " & RunCounter & ". " & TheCaption
						end if
					end if
					if RunCounter is NumberOfRecords then
						if InsertCaption then
							set TheImageLink to TheImageLink & TheCaptionTmp & "
</center>

" & TheReferences
						else
							set TheImageLink to TheImageLink & "
</center>

" & TheReferences
						end if
					end if
					
				end if
				
				
				if NumberOfRecords is greater than 1 and RunCounter is not equal to NumberOfRecords then
					set TheImageLink to TheImageLink & "
"
				end if
				
			end if
		end repeat
		
		set TheFullImageLink to TheImageLink
		set the clipboard to TheFullImageLink as string
		TheFullImageLink
		
		
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
		return
	end try
end tell