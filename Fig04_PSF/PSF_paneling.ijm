selectWindow("PSF BW");
setSlice(33);
setMinAndMax(0.000016368, 0.035300000);
run("8-bit");
run("Properties...", 
    "channels=1 "+
    "slices=65 "+
    "frames=1 "+
    "unit=µm "+
    "pixel_width=0.10 "+
    "pixel_height=0.10 "+
    "voxel_depth=0.25");
    
run("Grays");
makeRectangle(0, 47, 256, 162);
run("Crop");
makeLine(0, 81, 256, 81);
run("Reslice [/]...", "output=0.25 slice_count=1");
rename("XZ");

selectWindow("PSF BW");
setSlice(33);
run("Select None");
run("Duplicate...", "title=XY");

selectWindow("XY");
setThreshold(190, 255);
run("Capture Image");
rename("XY-TH190");

selectWindow("XZ");
setThreshold(190, 255);
run("Capture Image");
rename("XZ-TH190");

//assemle figure
selectWindow("XY");
resetThreshold();
selectWindow("XZ");
resetThreshold();

run("Combine...", "stack1=XY stack2=XZ");
run("RGB Color");
run("Combine...", "stack1=XY-TH190 stack2=XZ-TH190");
rename("th");
run("Combine...", "stack1=[Combined Stacks] stack2=th combine");
setForegroundColor(255, 255, 255);
makeRectangle(255, 0, 2, 324);
run("Fill", "slice");
makeRectangle(0, 161, 512, 2);
run("Fill", "slice");
run("Select None");

run("Scale Bar...", "width=5 height=4 font=14 color=White background=None location=[Lower Right]");
drawString("XY", 220, 150);
drawString("XZ", 476, 150);



