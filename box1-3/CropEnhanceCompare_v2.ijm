// Illustrate the dangers of converting image bith depth
// 2018-04-03: Simon F. Noerrelykke, ETH Zurich
 
/* Steps involved: Open image, crop a region, reset display range (or manually export to tiff), 
 *  convert to 8-bit with scaling; inspect results.
 *  What is happening: When an image is opened in Fiji, the display range is automatically
 *  calculated based on the pixel intensities in the image and this display range is the one used 
 *  when converting from 16 to 8 bit in a scaled fashion, which is the default setting of Fiji.
 *  When an image is cropped, it preserves the display range of the original and if saved it will write
 *  this display range as metadata to the file so that it looks the same when opened again.
 *  However, if the cropped image is exported , as opposed to saved, no display range metadata is saved 
 *  and when it is opened again Fiji will calculate the display range based on the pixel intensities 
 *  in this cropped image, which will therefore be different from the range of the original image.
 *  When this cropped, exported (or reset), opened image is next converted to 8bit with scaling, the 8bit image
 *  will have different values from an 8bit image produced if converted to 8bit directly after cropping 
 *  the original.
 *  
 *  We used the single 16bit image Week1_150607_C02_s3_w1E54F0108-F44A-4F6E-9637-6A9DE80F0823.tif 
 *  of DAPI stained nuclei from the  BBBC021_v1_images_Week1_22123.zip dataset.
 */

// --- INITIALIZE ---
run("Close All");

// Open original 16bit DAPI image from the Broad data set; convert to 8bit; save as file
open("/Users/simon/Desktop/Week1_150607_C02_s3_w1E54F0108-F44A-4F6E-9637-6A9DE80F0823.tif");
run("royal"); // LUT used

// Crop bright cell; convert to 8bit; save to file
selectWindow("Week1_150607_C02_s3_w1E54F0108-F44A-4F6E-9637-6A9DE80F0823.tif");
//makeRectangle(161, 127, 64, 64); // single cell
makeRectangle(293, 511, 80, 80); // double cell
roiManager("Add");
run("Duplicate...", "title=Bright_16bit_origRange"); // display range from original image
run("Duplicate...", "title=Bright_8bit_origRange"); // display range from original image
saveAs("PNG", "/Users/simon/Desktop/Bright_8bit_origRange.png"); // for paper
run("Conversions...", "scale");
run("8-bit");
run("Save", "save=/Users/simon/Desktop/Bright_8bit_origRange.tif");


//  Reset and extract display range, i.e. trigger autocalculation for cropped region
selectWindow("Bright_16bit_origRange");
run("Duplicate...", "title=Bright_16bit_brightRange"); // display range from cropped region
resetMinAndMax();
getMinAndMax(min_bright, max_bright);

// Convert (scaled) to 8bit; save to tiff file
selectWindow("Bright_16bit_brightRange");
run("Duplicate...", "title=Bright_8bit_brightRange"); // display range from cropped region
saveAs("PNG", "/Users/simon/Desktop/Bright_8bit_brightRange.png"); // for paper
run("Conversions...", "scale");
run("8-bit");
run("Save", "save=/Users/simon/Desktop/Bright_8bit_brightRange.tif");


// Crop dark cell; convert to 8 bit; save to file
selectWindow("Week1_150607_C02_s3_w1E54F0108-F44A-4F6E-9637-6A9DE80F0823.tif");
//makeRectangle(183, 197, 64, 64); // single cell
makeRectangle(205, 479, 80, 80); // double cell
roiManager("Add");
run("Duplicate...", "title=Dark_16bit_origRange");
run("Duplicate...", "title=Dark_8bit_origRange");
saveAs("PNG", "/Users/simon/Desktop/Dark_8bit_origRange.png"); // for paper
run("Conversions...", "scale");
run("8-bit");
run("Save", "save=/Users/simon/Desktop/Dark_8bit_origRange.tif");



//  Reset display range, i.e. trigger auto-calculation for cropped region
selectWindow("Dark_16bit_origRange");
run("Duplicate...", "title=Dark_16bit_darkRange"); // display range from cropped region
resetMinAndMax();
getMinAndMax(min_dark, max_dark);

// Convert (scaled) to 8bit; save to file
selectWindow("Dark_16bit_darkRange");
run("Duplicate...", "title=Dark_8bit_darkRange"); // display range from cropped region
saveAs("PNG", "/Users/simon/Desktop/Dark_8bit_darkRange.png"); // for paper
run("Conversions...", "scale");
run("8-bit");
run("Save", "save=/Users/simon/Desktop/Dark_8bit_darkRange.tif");

// Apply same display range to dark as to bright, convert and save
selectWindow("Dark_16bit_origRange");
run("Duplicate...", "title=Dark_16bit_brightRange"); // display range from bright cell
setMinAndMax(min_bright,max_bright);
run("Duplicate...", "title=Dark_8bit_brightRange"); // display range from cropped region
saveAs("PNG", "/Users/simon/Desktop/Dark_8bit_brightRange.png"); // for paper
run("Conversions...", "scale");
run("8-bit");
run("Save", "save=/Users/simon/Desktop/Dark_8bit_brightRange.tif");

// Apply same display range to bright as to dark, convert and save
selectWindow("Bright_16bit_origRange");
run("Duplicate...", "title=Bright_16bit_darkRange"); // display range from bright cell
setMinAndMax(min_dark,max_dark);
run("Duplicate...", "title=Bright_8bit_darkRange"); // display range from cropped region
saveAs("PNG", "/Users/simon/Desktop/Bright_8bit_darkRange.png"); // for paper
run("Conversions...", "scale");
run("8-bit");
run("Save", "save=/Users/simon/Desktop/Bright_8bit_darkRange.tif");

// Save original image with ROIs as 8bit png file
open("/Users/simon/Desktop/Week1_150607_C02_s3_w1E54F0108-F44A-4F6E-9637-6A9DE80F0823.tif");
run("royal"); // LUT used
run("Duplicate...", "title=Original_8bit_origRange"); // display range from original image
roiManager("Show All");
run("Flatten");
saveAs("PNG", "/Users/simon/Desktop/Original_8bit_origRange.png"); // for paper
