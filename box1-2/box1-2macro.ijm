// path needs to be adjusted for opening the source image from correct location. 
open("/Users/miura/Google Drive/NeuBIAS/WG6/2017_EMBO_IA_Integrity/box1-2/Week1_150607_B02_s1_w107447158-AC76-4844-8431-E6A954BD1174.tif");
orgID = getImageID();

// factor to be used to increase the intensity of image
amplify_facor = 1.2;
th_method = "MaxEntropy dark";

// cropping an arbiturary nuclues
makeRectangle(809, 398, 76, 63);
run("Duplicate...", " ");
rename("crop.tif");
run("Duplicate...", "title=cropAmplified.tif");
run("Multiply...", "value="+amplify_facor);

selectImage(orgID);
close();

// duplicating cropped image
selectWindow("crop.tif");
run("Duplicate...", "title=Threshold.tif");
selectWindow("crop.tif");
run("Duplicate...", "title=boundary.tif");
selectWindow("cropAmplified.tif");
run("Duplicate...", "title=Threshold2.tif");
selectWindow("cropAmplified.tif");
run("Duplicate...", "title=boundary2.tif");

// applying intensity threshold and detecting the boundary
selectWindow("Threshold.tif");
setAutoThreshold(th_method);
run("Create Selection");
selectWindow("boundary.tif");
run("Restore Selection");

selectWindow("Threshold2.tif");
setAutoThreshold(th_method);
run("Create Selection");
selectWindow("boundary2.tif");
run("Restore Selection");

// measure and acquire total intensity, mean intensity and area
run("Set Measurements...", "area mean standard min integrated display redirect=None decimal=3");
selectWindow("boundary.tif");
run("Measure");
total1 = getResult("IntDen", nResults - 1);
mean1 = getResult("Mean", nResults - 1);
area1 = getResult("Area", nResults - 1);
selectWindow("boundary2.tif");
run("Measure");
total2 = getResult("IntDen", nResults - 1);
mean2 = getResult("Mean", nResults - 1);
area2 = getResult("Area", nResults - 1);

print("");
print("**", th_method, amplify_facor, "**");
print("orig area\t", area1);
print("enh area\t", area2);
print("   area diff:", area1 - area2);
print("orig total\t", total1);
print("enhc expec\t", total1*amplify_facor);
print("enhc total\t", total2);
print("diff:",  total1*amplify_facor - total2);
print("--");
print("orig mean\t", mean1);
print("enhc expec\t", mean1*amplify_facor);
print("enhc meani\t", mean2);


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

selectWindow("cropAmplified.tif");
run("Capture Image");
rename("p4.tif");

selectWindow("Threshold2.tif");
run("Capture Image");
rename("p5.tif");

selectWindow("boundary2.tif");
run("Capture Image");
rename("p6.tif");

run("Combine...", "stack1=p1.tif stack2=p2.tif");
run("Combine...", "stack1=[Combined Stacks] stack2=p3.tif");
rename("originals.tif");

run("Combine...", "stack1=p4.tif stack2=p5.tif");
run("Combine...", "stack1=[Combined Stacks] stack2=p6.tif");
rename("amplified.tif");

run("Combine...", "stack1=originals.tif stack2=amplified.tif combine");

setForegroundColor(255, 255, 255);
run("Specify...", "width=3 height=126 x=75 y=0");
run("Fill", "slice");
run("Specify...", "width=3 height=126 x=151 y=0");
run("Fill", "slice");
run("Specify...", "width=228 height=3 x=0 y=63");
run("Fill", "slice");
run("Select None");

//62, 42
//76 x 63
setFont("Serif", 20, "antiliased");
xbase = 61;
ybase = 24;
drawString("a", xbase, ybase);
drawString("b", xbase + 76, ybase);
drawString("c", xbase + 76 + 76, ybase);
drawString("d", xbase, 63 + ybase);
drawString("e", xbase + 76, ybase + 63);
drawString("f", xbase + 76 + 76, ybase + 63);

/*
** MaxEntropy dark 1.2 **
orig area  1072
enh area     1050
   area diff: 22
orig total   2892848
enhc expec   3471417.6
enhc total   3439137
diff: 32280.6
--
orig mean    2698.5522
enhc expec   3238.2627
enhc meani   3275.3686

 */

// add scale bar 10 micrometer
run("Set Scale...", "distance=1 known=0.656 unit=µm");
makeRectangle(207, 120, 17, 4);
run("Scale Bar...", "width=10 height=2 font=14 color=White background=None location=[At Selection] bold hide");




