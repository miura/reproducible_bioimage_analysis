// Open the original image
run("Embryos (42K)");

// extract the first embryo
makeRectangle(658, 570, 122, 127);
run("Duplicate...", " ");

// extract the second embryo
selectWindow("embryos.jpg");
makeRectangle(1012, 714, 122, 127);
run("Duplicate...", " ");

// combine two embryos side-by-side
run("Combine...", "stack1=embryos-1.jpg stack2=embryos-2.jpg");

// insert white bar between embryo 
run("Specify...", "width=3 height=127 x=121 y=0");
run("Colors...", "foreground=white background=black selection=green");
setForegroundColor(255, 255, 255);
run("Fill", "slice");

// finish
run("Select None");