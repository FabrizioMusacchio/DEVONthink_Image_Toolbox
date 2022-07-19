-- Generate a set of HTML image links, that can be inserted into Markdown files. 
-- The set will be saved into the clipboard and can be pasted into the desired Markdown
-- document.
--
-- author: Fabrizio Musacchio (https://www.fabriziomusacchio.com)
-- date: Feb 13, 2022


set GridChoices to {"grid 1 (100% width) + caption", "grid 1 (100% width)", "grid 2 (50% width) + caption", "grid 2 (50% width)", "grid 3 (33% width) + caption", "grid 3 (33% width)", "enter individual width"}
set TheGridChoice to choose from list GridChoices with prompt "Generating an image-set of currently selected images. The set will be copied to the clipboard and can be inserted into a Markdown file (as HTML code). 

Please select a grid size, i.e., how many images to show per row. The '+ caption' option extracts the image annotations and adds them as captions under each image (for image widths >= 25%)." default items {"2 (50% width) + caption"} with title "Choose image width"


if TheGridChoice is false then
	error number -128
else if text of TheGridChoice is {"enter individual width"} then
	set dialogResult to display dialog "Please enter an image width (in %)" buttons {"Cancel", "OK"} default button "OK" cancel button "Cancel" default answer ("24") with title "Choose image width"
	set InsertCaption to false --false true
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
		--set TheWidth to 32 -- %
		--set InsertCaption to true --false true
		
		set TheFullImageLink to "<div style='text-align: center;'>"
		set TheImageLink to ""
		
		set RunCounter to 0
		repeat with thisRecord in theRecords
			--set theType to (type of thisRecord) as string
			if the type of thisRecord is equal to picture then
				--if theType is "picture" then
				--set theDialogText to "is image file."
				--display dialog theDialogText buttons {"Okay"} default button "Okay"
				set RunCounter to RunCounter + 1
				
				try
					--set TheCaption to plain tetx of TheCaptionObject
					--set TheCaption to plain text of thisRecord's annotation
					set TheCaption to the comment of thisRecord
				on error --error_message number error_number
					set TheCaption to " "
				end try
				set TheImageName to thisRecord's name
				set TheImageURL to "x-devonthink-item://" & thisRecord's uuid
				--set theDialogText to listSize & TheCaption & TheImageName
				--display dialog theDialogText as string buttons {"Okay"} default button "Okay"
				
				--if InsertCaption then
				--set ImageSeparator to ""
				--end if
				
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
						set TheImageLink to TheImageLink & TheFullImageLink & "<a href='" & TheImageURL & "'><img src='" & TheImageURL & "' style='width: " & TheWidth & "%;'></a>

" & TheCaption & " (" & TheImageName & ")" & "
</div>
"
					else
						set TheImageLink to TheImageLink & TheFullImageLink & "<a href='" & TheImageURL & "'><img src='" & TheImageURL & "' style='width: " & TheWidth & "%;'></a>
</div>
"
						
					end if
				else if TheGridSize is not 999 then
					-- the 49%-32% and 32%-24% width cases:
					if InsertCaption then
						if RunCounter mod TheGridSize is not 0 then
							if RunCounter mod TheGridSize is 1 then
								set TheImageLink to TheImageLink & TheFullImageLink & "<a href='" & TheImageURL & "'><img src='" & TheImageURL & "' style='width: " & TheWidth & "%;'></a>"
								set TheCaptionTmp to "

**Left**: " & TheCaption
							else
								set TheImageLink to TheImageLink & "<a href='" & TheImageURL & "'><img src='" & TheImageURL & "' style='width: " & TheWidth & "%;'></a>"
								if TheGridSize is 3 then
									set TheCaptionTmp to TheCaptionTmp & " Ð **Middle**: " & TheCaption
								end if
							end if
						else
							set TheImageLink to TheImageLink & "<a href='" & TheImageURL & "'><img src='" & TheImageURL & "' style='width: " & TheWidth & "%;'></a>"
							set TheCaptionTmp to TheCaptionTmp & " Ð **Right**: " & TheCaption & "
</div>
"
							set TheImageLink to TheImageLink & TheCaptionTmp
						end if
						if RunCounter = NumberOfRecords and RunCounter mod TheGridSize is not 0 then
							set TheImageLink to TheImageLink & TheCaptionTmp
							
						end if
					else
						if RunCounter mod TheGridSize is 1 then
							set TheImageLink to TheImageLink & TheFullImageLink & "<a href='" & TheImageURL & "'><img src='" & TheImageURL & "' style='width: " & TheWidth & "%;'></a>"
						else if RunCounter mod TheGridSize is 2 then
							set TheImageLink to TheImageLink & "<a href='" & TheImageURL & "'><img src='" & TheImageURL & "' style='width: " & TheWidth & "%;'></a>"
						else
							set TheImageLink to TheImageLink & "<a href='" & TheImageURL & "'><img src='" & TheImageURL & "' style='width: " & TheWidth & "%;'></a>
</div>
"
						end if
					end if
					
					if RunCounter = NumberOfRecords and RunCounter mod TheGridSize is not 0 then
						set TheImageLink to TheImageLink & "
</div>
"
					end if
					
					
				else
					-- any other case (i.e., grid-widths smaller than 24%):
					-- at the moment w/o a caption option. 
					if RunCounter is 1 then
						set TheImageLink to TheImageLink & TheFullImageLink & "<a href='" & TheImageURL & "'><img src='" & TheImageURL & "' style='width: " & TheWidth & "%;'></a>"
					else
						set TheImageLink to TheImageLink & "<a href='" & TheImageURL & "'><img src='" & TheImageURL & "' style='width: " & TheWidth & "%;'></a>"
					end if
					if RunCounter is NumberOfRecords then
						set TheImageLink to TheImageLink & "
</div>
"
					end if
					
				end if
				
				
				if NumberOfRecords is greater than 1 and RunCounter is not equal to NumberOfRecords then
					set TheImageLink to TheImageLink & "
"
				end if
				
				--if RunCounter is not equal to NumberOfRecords then
				--	display dialog "hallo" as string buttons {"Okay"} default button "Okay"
				--end if
				
				--[listSize, TheCaption, TheImageName, "x-devonthink-item://" & TheImageURL]
				--TheImageLink
				
				
			end if
		end repeat
		
		--if TheWidth > 49 then
		--	set TheFullImageLink to TheImageLink & "</div>"
		--else
		--	set TheFullImageLink to TheImageLink
		--end if
		set TheFullImageLink to TheImageLink
		set the clipboard to TheFullImageLink as string
		TheFullImageLink
		
		
		
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
		return
	end try
end tell