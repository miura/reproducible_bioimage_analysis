///Users/miura/Google Drive/NeuBIAS/WG6/2017_EMBO_IA_Integrity/box1-4/IXMtest_A09_s1_w1CE70AD49-290D-4312-82E6-CDC717F32637.tif
selectWindow("IXMtest_A09_s1_w1CE70AD49-290D-4312-82E6-CDC717F32637.tif");
print( getTitle() );
makeRectangle(135, 317, 80, 60);
run("Duplicate...", "title=crop.tif");
run("8-bit");
cropID = getImageID();
run("Canvas Size...", "width=80 height=184 position=Top-Center");

//two nucleus at once
selectImage(cropID);
makeRectangle(0, 0, 80, 60);
run("Duplicate...", "title=twonuc.tif");
twonucID = getImageID();
run("Enhance Contrast", "saturated=0.35");
run("Apply LUT");
run("Copy");
close();
selectImage(cropID);
makeRectangle(0, 62, 80, 60);
run("Paste");

//left nucleus
selectImage(cropID);
makeRectangle(0, 0, 40, 60);
run("Duplicate...", "title=nuc1.tif");
nuc1ID = getImageID();
run("Enhance Contrast", "saturated=0.35");
run("Apply LUT");
run("Copy");
close();
selectImage(cropID);
makeRectangle(0, 124, 40, 60);
run("Paste");

//right nucleus
selectImage(cropID);
makeRectangle(40, 0, 40, 60);
run("Duplicate...", "title=nuc1.tif");
nuc12D = getImageID();
run("Enhance Contrast", "saturated=0.35");
run("Apply LUT");
run("Copy");
close();
selectImage(cropID);
makeRectangle(40, 124, 40, 60);
run("Paste");

//figure plot
//makeRectangle(40, 120, 1, 64);
//run("Fill");
makeRectangle(0, 60, 80, 1);
run("Fill");
makeRectangle(0, 120, 80, 1);
run("Fill");
run("Select None");

//scalebar
run("Size...", "width=160 height=368 depth=1 constrain average");

setFont("Serif", 24, "antiliased");
xbase = 5;
ybase = 24;
drawString("a", xbase, ybase);
drawString("b", xbase, ybase + 62*2);
drawString("c", xbase, ybase + 124*2);

