# DEVONthink Image Toolbox

This is a collection of Appelscripts for processing images in DEVONthink. It contains the following script sets:

* [ Image auto-rename and annotate](#image-auto-rename-and-annotate) – renames images according the scheme `img######` and stores the original file name as a comment
* [JPG compression](#jpg-compression) – a JPG compressor and JPG converter
* [Change DPI](#change-dpi) - a DPI changer and JPG converter


## Image auto-rename and annotate
The script 

* **Image auto-rename and annotate.applescript**

renames the selected images according the scheme `img######`, i.e., the new names will consist of "`img`" and a number. The number will be increased every time the script is run and for every renamed image. In this way, each renamed image file gets a **unique file name**. This reduces file name ambiguity which, e.g., becomes a crucial point while using DEVNthink's _WikiLinks_ feature. It also makes images better distinguishable from other files while searching.


The original file names will be stored as a Finder comment and the script offers the following options:  

<center>
<a href="Screenshots/Image auto-rename and annotate menu.png"><img src="Screenshots/Image auto-rename and annotate menu.png" style="width: 70%;"></a>
</center>

**Replace with current image name**
: The current comment will be replaced by the current image name. 

**Replace with custom text**
: The current comment will be replaced by a custom text.

**Replace with custom text + increasing number**
: The current comment will be replaced by a custom text and an increasing number will be attached to that text.

**Don't replace current annotation**
: The current comment will not be replaced.

**Remove current annotation and leave empty**
: Removes the current comment and leaves it empty.

**Add current image name**
: The current image name will be added to the current comment.

**Add custom text**
: A custom text will be added to the current comment.

**Add custom text + increasing number**
: A custom text with an attached increasing number will be added to the current comment.

### Required preparation for the script
To make the script work, you first have to create an empty document in DEVONthink (of any kind; however, the script is only tested for Markdown files). Copy the reference link of that file and extract the UUID part of the link, i.e., remove "`x-devonthink-item://`" from the link text, e.g., 

<center>

`x-devonthink-item://58111DBA-42BA-4EE1-A251-FAF27C3FDA81` $\rightarrow$ `58111DBA-42BA-4EE1-A251-FAF27C3FDA81`

</center>

Insert the UUID into the `UUID_of_imager_counter` variable within the script. Do not edit or store anything else within the created file: It serves to store the running number for renaming the images. The variable `leading_zeros` controls the number of leading zeros of that counter.

### Acknowledgement
The script uses a function to add leading zeros to the file names (`addLeadingZerosToNumber`). This function taken from [developer.apple.com](https://developer.apple.com/library/archive/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/ManipulateNumbers.html). 



## JPG compression
This set of scripts compresses the selected images to a chosen compression level:

* a pre-defined level of 70% ("**JPG compress 70%.applescript**")
* a pre-defined level of 80% ("**JPG compress 80%.applescript**")
* a pre-defined level of 100% ("**JPG compress 100%.applescript**"), e.g., to reset any previous compression
* a freely entered level ("**JPG compress XY%.applescript**")

The scripts are written in such a way that they do not distinguish between JPG and other image file formats (PNG, TIFF, ...). Any chosen image file will be converted into JPG (if it isn't a JPG yet) and compressed to the chosen compression level. However, the original filename and file extension are retained as well as the file's `uuid` (DEVONthink's internal ID for that file, which also serves as the file's reference link). In this way, you will not lose already applied link references to that image file in other documents. The reason for this intended behaviour is the  conversion of any image file into JPG in order to reduce the file size and save some disk space. 

### Remark 
It may be a bit confusing that the file extension is retained, when a TIFF or a PNG is converted into a JPG. However, any converted image file will be indeed a JPG, which can be cross-checked, e.g., in the info pane of the _Preview_ app.

<center>
<a href="Screenshots/JPG compression 1.png"><img src="Screenshots/JPG compression 1.png" style="width: 41%;"></a>
<a href="Screenshots/JPG compression 2.png"><img src="Screenshots/JPG compression 2.png" style="width: 49%;"></a>

<b>Left</b>: The info pane of a converted TIFF in DEVONthink's inspector, that still shows the file as TIFF. <b>Right</b>: The info pane in macOS' _Preview_ app for the same file, which correctly identifies the file as a JPG.
</center>


## Change DPI
This set of scripts changes the DPI of the selected images to a chosen value:

* a pre-defined DPI of 72 ("**Change DPI to 72.applescript**")
* a pre-defined DPI of 90 ("**Change DPI to 90.applescript**")
* a freely entered DPI value ("**Change DPI to XY.applescript**")


<center>
<a href="Screenshots/Change DPI 1.png"><img src="Screenshots/Change DPI 1.png" style="width: 49%;"></a>
<a href="Screenshots/Change DPI 2.png"><img src="Screenshots/Change DPI 2.png" style="width: 49%;"></a>

<b>Left</b>: The info pane of  JPG file with a DPI of 72 . <b>Right</b>: The info pane of the same file after a DPI conversion 90.
</center>

### Remark
As for the JPG compression scripts, this scripts do not not distinguish between JPG and other image file formats and will convert any image file into JPG (if it isn't a JPG yet).
