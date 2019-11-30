// Generate two circles with different intensities
newImage("circles", "8-bit black", 256, 512, 1);
orgID = getImageID();
setColor(150);
fillOval(58, 58, 140, 140);
setColor(250);
fillOval(58, 314, 140, 140);
run("Gaussian Blur...", "sigma=20");
run("Duplicate...", " ");
dupID = getImageID();
selectImage( orgID );
// measure each circle using typically used methods
run("Set Measurements...", "area mean modal perimeter integrated redirect=None decimal=2");
run("Auto Threshold", "method=Otsu white setthreshold");
run("Analyze Particles...", "display exclude clear add");
// measurements using the original boundary definitions
makeOval(58, 58, 140, 140);
roiManager("Add");
run("Measure");
makeOval(58, 314, 140, 140);
roiManager("Add");
run("Measure");
run("Select None");
resetThreshold();

// following part is executed for the second figure
run("RGB Color");
setForegroundColor(0, 198, 255);
roiManager("Select", 2);
run("Draw", "slice");
roiManager("Select", 3);
run("Draw", "slice");
setForegroundColor(255, 255, 0);
roiManager("Select", 0);
run("Draw", "slice");
roiManager("Select", 1);
run("Draw", "slice");
run("Select None");
roiManager("Show None");
setForegroundColor(255, 255, 255);

//correct methods
selectImage( dupID );
individualMeasure(0, 0, 256, 256);
individualMeasure(0, 256, 256, 256);


function individualMeasure(x, y, width, height){
	makeRectangle(x, y, width, height);
	run("Duplicate...", " ");
	run("Auto Threshold", "method=Otsu white setthreshold");
	run("Create Selection");
	run("Measure");
	close();
}

//create the figure
selectImage( dupID );
run("Select None");
run("RGB Color");
run("Canvas Size...", "width=514 height=512 position=Center-Left");
selectImage( orgID );
run("Copy");
selectImage( dupID );
makeRectangle(258, 0, 256, 512);
run("Paste");
makeRectangle(256, 0, 2, 512);
setForegroundColor(255, 255, 255);
run("Fill", "slice");
run("Select None");
setFont("Serif", 48, "antiliased");
xbase = 10;
ybase = 50;
drawString("a", xbase, ybase);
drawString("b", xbase + 258, ybase);

