// path needs to be adjusted for opening the source image from correct location. 
open("/Users/miura/Google Drive/NeuBIAS/WG6/2017_EMBO_IA_Integrity/box1-2/Week1_150607_B02_s1_w107447158-AC76-4844-8431-E6A954BD1174.tif");
orgID = getImageID();

// cropping an arbiturary nuclues
makeRectangle(809, 398, 76, 63);
run("Duplicate...", " ");
rename("crop.tif");

selectImage(orgID);
close();

// duplicating cropped image
selectWindow("crop.tif");
run("Duplicate...", "title=Threshold.tif");
selectWindow("crop.tif");
run("Duplicate...", "title=boundary.tif");

// applying intensity threshold and detecting the boundary
selectWindow("Threshold.tif");
setAutoThreshold("Default dark");
run("Create Selection");
selectWindow("boundary.tif");
run("Restore Selection");

// creating the figure

selectWindow("crop.tif");
run("Capture Image");
rename("p1.tif");

selectWindow("Threshold.tif");
run("Capture Image");
rename("p2.tif");

selectWindow("boundary.tif");
run("Capture Image");
rename("p3.tif");

run("Combine...", "stack1=p1.tif stack2=p2.tif");
run("Combine...", "stack1=[Combined Stacks] stack2=p3.tif");

setForegroundColor(255, 255, 255);
run("Specify...", "width=3 height=63 x=75 y=0");
run("Fill", "slice");
run("Specify...", "width=3 height=63 x=151 y=0");
run("Fill", "slice");
run("Select None");




