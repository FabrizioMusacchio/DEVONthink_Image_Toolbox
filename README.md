# DEVONthink Image Toolbox

This is a collection of AppleScripts for handling images in DEVONthink. It contains the following script sets:
 
* [Image auto-rename and annotate](#image-auto-rename-and-annotate) – renames images according the scheme `img######` and stores the original file name as a comment
* [Generate image set](#generate-image-set) – generates a set of image links, arranged in a desired grid size (1, 2, 3, 4, ... image(s) per row)
* [JPG compression](#jpg-compression) – a JPG compressor and JPG converter
* [Change DPI](#change-dpi) - a DPI changer and JPG converter

<p align="center">
<img src="Screenshots/DT_Image Toolbox logo.png" style="width: 50%;"></a>
</p>

<a name="image-auto-rename-and-annotate"></a>

## Image auto-rename and annotate
The script 

* **Image auto-rename and annotate.applescript**

renames the selected images according the scheme `img######`, i.e., the new names will consist of "`img`" and a number. The number will be increased every time the script is run and for every renamed image. In this way, each renamed image file gets a **unique file name**. This reduces file name ambiguity which, e.g., becomes a crucial point when using DEVONthink's _WikiLinks_ feature. It also makes images better distinguishable from other files in _DEVONthink_'s  search.


The original file names will be stored in the images' *Finder* comments for which the script offers the following options:  

<p align="center">
<a href="Screenshots/Image auto-rename and annotate menu.png"><img src="Screenshots/Image auto-rename and annotate menu.png" style="width: 70%;"></a>
</p>

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

<div style="text-align: center;">

`x-devonthink-item://58111DBA-42BA-4EE1-A251-FAF27C3FDA81` $\rightarrow$ `58111DBA-42BA-4EE1-A251-FAF27C3FDA81`

</div>

Insert the UUID into the `UUID_of_imager_counter` variable within the script. Do not edit or store anything else within the created file: It serves to store the running number for renaming the images. The variable `leading_zeros` controls the number of leading zeros of that counter.

### Acknowledgement
The script uses a function to add leading zeros to the file names (`addLeadingZerosToNumber`). This function is taken from [developer.apple.com](https://developer.apple.com/library/archive/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/ManipulateNumbers.html). 


## Generate image set
The scripts

* **Generate image set (Markdown).applescript**
* **Generate image set (HTML).applescript**

generate a set of image links, arranged in a desired grid size. Available grid options are:

<p align="center">
<a href="Screenshots/Generate image set.png"><img src="Screenshots/Generate image set.png" style="width: 70%;"></a>
</p>

**grid 1 (100% width)**
: Arranges one image per row with an image width of 100%.

**grid 2 (50% width)**
: Arranges two images per row with an image width of 49%.

**grid 3 (33% width)**
: Arranges three images per row with an image width of 32%.

**enter individual width**
: Arranges as many images per row, as the custom entered image width allows, i.e., 100//entered value ("//" = integer division). E.g., a width of 24% allows four images per row, a width of 19% five images per row, and so forth. 

**"+ caption" options**
: The "+ caption" option extracts the image annotations from the images' Finder comments and adds them (if available) as captions under each image. In the HTML version, this option is only available for image widths $\geq$ 25%.

The generated sets will be saved to the clipboard and can be pasted into the desired Markdown document.

The image links are generated in such a way, that you can click on them and the corresponding image file opens (i.e, they additionally contain a link to themselves). The reason for this behavior is to enable the images to be opened, e.g., in a new tab in DEVONthink and to enable the full-size view of the images in DTTG.

### Markdown version
The Markdown version (**Generate image set (Markdown).applescript**) generates Markdown image links, e.g.:

```markdown
<center>

[![img058627]] 
[![img058628]] 
[![img058629]] 

**Left**: Enso 0 – **Middle**: Enso 1 – **Right**: Enso 2
</center>

[img058627]: x-devonthink-item://80581B4F-2509-4ADE-9720-B0C77A5B758A style="width:32%;"
[img058628]: x-devonthink-item://440D0398-C1F1-4F7A-BD6B-1EA212294404 style="width:32%;"
[img058629]: x-devonthink-item://4C074346-878B-463C-A000-3CC824420BB3 style="width:32%;"
```


<p align="center">
<a href='Screenshots/img058627.png'><img src='Screenshots/img058627.png' style='width: 32%;'></a>
<a href='Screenshots/img058628.png'><img src='Screenshots/img058628.png' style='width: 32%;'></a>
<a href='Screenshots/img058629.png'><img src='Screenshots/img058629.png' style='width: 32%;'></a>

**Left**: Enso 0 – **Middle**: Enso 1 – **Right**: Enso 2
</p>

I think, the Markdown version only makes sense when it is used in combination with the [Image auto-rename and annotate](#image-auto-rename-and-annotate) script. Otherwise the image reference links could become too long and the unambiguity of the references is not ensured. 


### HTML version
The HTML version (**Generate image set (HTML).applescript**) generates HTML image links, e.g.:

```html
<div style='text-align: center;'>
<a href='x-devonthink-item://80581B4F-2509-4ADE-9720-B0C77A5B758A'><img src='x-devonthink-item://80581B4F-2509-4ADE-9720-B0C77A5B758A' style='width: 32%;'></a>
<a href='x-devonthink-item://440D0398-C1F1-4F7A-BD6B-1EA212294404'><img src='x-devonthink-item://440D0398-C1F1-4F7A-BD6B-1EA212294404' style='width: 32%;'></a>
<a href='x-devonthink-item://4C074346-878B-463C-A000-3CC824420BB3'><img src='x-devonthink-item://4C074346-878B-463C-A000-3CC824420BB3' style='width: 32%;'></a>

**Left**: Enso 0 – **Middle**: Enso 1 – **Right**: Enso 2
</div>
```

The generated image set is rendered in the same way as the Markdown example above.  


## JPG compression
This set of scripts compresses the selected images to a chosen compression level:

* a pre-defined level of 70% ("**JPG compress 70%.applescript**")
* a pre-defined level of 80% ("**JPG compress 80%.applescript**")
* a pre-defined level of 100% ("**JPG compress 100%.applescript**"), e.g., to reset any previous compression
* a freely entered level ("**JPG compress XY%.applescript**")

The scripts are written in such a way, that they do not distinguish between JPG and other image file formats (PNG, TIFF, ...). Any chosen image file will be converted into JPG (if it isn't a JPG yet) and compressed to the chosen compression level. The reason for this intended behaviour is to reduce the file size and thus save some disk space by using the JPG format. 

However, the original filename and file extension are retained as well as the file's UUID (_DEVONthink_'s internal file ID, that also serves as the file's reference link). In this way, you will not lose already applied link references to that image file in other documents. 

It could be a bit confusing that the file extension is retained, when a TIFF or a PNG image is converted into a JPG image. However, any converted image file will be indeed a JPG, which can be cross-checked, e.g., in the info pane of the _Preview_ app:

<p align="center">
<a href="Screenshots/JPG compression 1.png"><img src="Screenshots/JPG compression 1.png" style="width: 41%;"></a>
<a href="Screenshots/JPG compression 2.png"><img src="Screenshots/JPG compression 2.png" style="width: 49%;"></a><br>

<b>Left</b>: The info pane of a converted TIFF in DEVONthink's inspector, that still shows the file as TIFF. <b>Right</b>: The info pane in macOS' _Preview_ app for the same file, which correctly identifies the file as a JPG.
</p>


## Change DPI
This set of scripts changes the DPI of the selected images to a chosen value:

* a pre-defined DPI of 72 ("**Change DPI to 72.applescript**")
* a pre-defined DPI of 90 ("**Change DPI to 90.applescript**")
* a freely entered DPI value ("**Change DPI to XY.applescript**")


<p align="center">
<a href="Screenshots/Change DPI 1.png"><img src="Screenshots/Change DPI 1.png" style="width: 49%;"></a>
<a href="Screenshots/Change DPI 2.png"><img src="Screenshots/Change DPI 2.png" style="width: 49%;"></a>

<b>Left</b>: The info pane of a JPG file with 72 DPI. <b>Right</b>: The info pane of the same file after a conversion to 90 DPI.
</p>

### Remark
As for the JPG compression scripts, these scripts do not distinguish between JPG and other image file formats and will convert any image file into JPG (if it isn't a JPG yet).
