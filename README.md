# DEVONthink Image Toolbox

This is a collection of Appelscripts for processing images in DEVONthink.



## JPG compression
This set of scripts compresses the selected images to a chosen compression level:

* a pre-defined level of 70% ("**JPG compress 70%**")
* a pre-defined level of 80% ("**JPG compress 80%**")
* a pre-defined level of 100% ("**JPG compress 100%**"), e.g., to reset any previous compression
* a freely entered level ("**JPG compress XY%**")

The scripts are written in such a way that they do not distinguish between JPG and other image file formats (PNG, TIFF, ...). Any chosen image file will be converted into JPG (if it isn't a JPG yet) and compressed to the chosen compression level. However, the original filename and file extension are retained as well as the file's `uuid` (DEVONthink's internal ID for that file, which also serves as the file's reference link). In this way, you will not lose already applied link references to that image file in other documents. The reason for this intended behaviour is the  conversion of any image file into JPG in order to reduce the file size and save some disk space. 

### Remark 
It may be a bit confusing that the file extension is retained, when a TIFF or a PNG is converted into a JPG. However, any converted image file will be indeed a JPG, which can be cross-checked, e.g., in the info pane of the _Preview_ app.

<div style="text-align: center;">
<a href="Screenshots/JPG compression 1.png"><img src="Screenshots/JPG compression 1.png" style="width: 41%;"></a>
<a href="Screenshots/JPG compression 2.png"><img src="Screenshots/JPG compression 2.png" style="width: 49%;"></a>

<b>Left</b>: The info pane of a converted TIFF in DEVONthink's inspector, that still shows the file as TIFF. <b>Right</b>: The info pane in macOS' _Preview_ app for the same file, which correctly identifies the file as a JPG.
</div> 


## Change DPI
This set of scripts changes the DPI of the selected images to a chosen value:

* a pre-defined DPI of 72 ("**Change DPI to 72**")
* a pre-defined DPI of 90 ("**Change DPI to 90**")
* a freely entered DPI value ("**Change DPI to XY**")


<div style="text-align: center;">
<a href="Screenshots/Change DPI 1.png"><img src="Screenshots/Change DPI 1.png" style="width: 49%;"></a>
<a href="Screenshots/Change DPI 2.png"><img src="Screenshots/Change DPI 2.png" style="width: 49%;"></a>

<b>Left</b>: The info pane of  JPG file with a DPI of 72 . <b>Right</b>: The info pane of the same file after a DPI conversion 90.
</div> 

### Remark
As for the JPG compression scripts, this scripts do not not distinguish between JPG and other image file formats and will convert any image file into JPG (if it isn't a JPG yet).