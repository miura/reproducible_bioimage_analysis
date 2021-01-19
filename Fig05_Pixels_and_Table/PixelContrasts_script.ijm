newImage("original", "8-bit black", 400, 200, 1);
run("Specify...", "width=200 height=200 x=0 y=0");
setForegroundColor(144, 144, 144);
run("Fill", "slice");
run("Specify...", "width=200 height=200 x=200 y=0");
setForegroundColor(157, 157, 157);
run("Fill", "slice");

newImage("enhanced", "8-bit black", 400, 200, 1);
run("Specify...", "width=200 height=200 x=0 y=0");
setForegroundColor(99, 99, 99);
run("Fill", "slice");
run("Specify...", "width=200 height=200 x=200 y=0");
setForegroundColor(210, 210, 210);
run("Fill", "slice");

setForegroundColor(255, 255, 255);