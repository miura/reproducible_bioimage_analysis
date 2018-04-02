// open Broad dataset and crop some regions in 16 bit image
// 2018-03-28, sfn: created

run("Close All");
// open 16 bit image
run("Bio-Formats","open=/Users/simon/Desktop/human_ht29_colon_cancer_1_images/AS_09125_050118150001_A03f00d0.DIB color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT series_1");

/* This step is required to trigger Fiji's auto-scaling of contrast for display 
 *  that is normally applied when a tiff image is opened.
 *  According to Kota, Wayne implemented a normalisation with some (unknown) level of pixel saturation.
 *  Really shouldn't make a difference, but it does, depending on image format
 */
run("Invert");
run("Invert");

// --- INITIALIZE ---
width = 400;
height = 400;

// select region and dupliate it
makeRectangle(290, 158, 80, 80);
run("Duplicate...", "title=Cropped");
setLocation(10, 100, width, height);
selectWindow("AS_09125_050118150001_A03f00d0.DIB - Well A03, Field #00");
close();

// --- EXAMINE EFFECT OF APPLYING LUT ---
// Enhance contrast; apply; convert to 8-bit w. scaling
selectWindow("Cropped");
run("Duplicate...", "title=EnhanceApplyScaleConvert"); //Applied Enhance, Scaled Conversion
setLocation(10, 100, width, height);
run("Enhance Contrast", "saturated=0.35");
run("Apply LUT");
run("Conversions...", "scale");
run("8-bit");
run("Histogram");

// Enhance contrast (but don't apply); convert to 8-bit w. scaling
// R1_2 will differ from R1_1, even if only slightly
selectWindow("Cropped");
run("Duplicate...", "title=EnhanceScaleConvert"); //Un-Applied Enhance, Scaled Conversion
setLocation(10, 100, width, height);
run("Enhance Contrast", "saturated=0.35");
// run("Apply LUT");
run("Conversions...", "scale");
run("8-bit");
run("Histogram");

// --- EXAMINE EFFECT OF CONVERTING WO SCALING ---
// The result of 
// Enhance contrast; apply; convert to 8-bit wo. scaling
// Strangely, R1_3 is very different from R1_1
selectWindow("Cropped");
run("Duplicate...", "title=EnhanceApplyConvert"); //Applied Enhance, Un-Scaled Conversion
setLocation(10, 100, width, height);
run("Enhance Contrast", "saturated=0.35");
run("Apply LUT");
run("Conversions...", " ");
run("8-bit");
run("Histogram");

// Enhance contrast (but don't apply; convert to 8-bit wo. scaling
selectWindow("Cropped");
run("Duplicate...", "title=EnhanceConvert"); //Un-Applied Enhance, Un-Scaled Conversion
setLocation(10, 100, width, height);
run("Enhance Contrast", "saturated=0.35");
// run("Apply LUT");
run("Conversions...", " ");
run("8-bit");
run("Histogram");




// --- EXAMINE EFFECT OF CONVERTING BEFORE ENHANCING ---
// Convert to 8-bit w. scaling; enhance contrast; apply
/* It seems like this actually performs an un-scaled conversion:   
 *  The histogram has values from 135-1233,
 *  but the image (according to image info) has values 0-65535. 
 *  Appears as if the latter values are used as min and max in the "scaled" conversion, 
 *  giving rise to a converted (enhanced) image that has only four different values (0, 85, 170, 255)
*/
selectWindow("Cropped");
run("Duplicate...", "title=ScaleConvertEnhanceApply"); //Scaled Conversion, Applied Enhance
setLocation(10, 100, width, height);
// inspect image and histogram values
	imfinfo = getImageInfo();
	print(imfinfo);
	getStatistics(area, mean, min, max);
	print(min, max);
// ----

run("Conversions...", "scale");
run("8-bit");
// inspect image and histogram values
	imfinfo = getImageInfo();
	print(imfinfo);
	getStatistics(area, mean, min, max);
	print(min, max);
// ----

run("Enhance Contrast", "saturated=0.35");
run("Apply LUT");
// inspect image and histogram values
	imfinfo = getImageInfo();
	print(imfinfo);
	getStatistics(area, mean, min, max);
	print(min, max);
// ----

run("Histogram");


// Convert to 8-bit wo. scaling; enhance contrast; apply
/* This looks better than R1_5
 * The un-scaled conversion doesn't seem to take place though:
 * Before conversion, the 16 bit image has intensities between 135 and 1233
 * After conversion the values are 0-255, with good resolution 
 * Resolution is better than it should be for unscaled linear conversion, i.e., 256 values (16bit) per bin (8bit)
 * There should only have been (1233-132+1)/256 = 4 bins in this conversion
 * Indeed, it looks like a scaled conversion where the brightest pixels were all lumped into bin 255: 
 * Bin 255 has 1288 counts, or 20.1 %
 * The first 135 bins are empty though
 * Best bet: The unscaled conversion scales between a minimum of 135 (the min) and 287 (the mean in 16bit),
 * yet keeps the min of 135
 */
selectWindow("Cropped");
run("Duplicate...", "title=ConvertEnhanceApply"); //Un-Scaled Conversion, Applied Enhance
setLocation(10, 100, width, height);
run("Conversions...", " ");
run("8-bit");
run("Enhance Contrast", "saturated=0.35");
run("Apply LUT");
run("Histogram");

// testing ground
selectWindow("Cropped");
imfinfo = getImageInfo();
print(imfinfo);

getStatistics(area, mean, min, max);
print(min, max);

