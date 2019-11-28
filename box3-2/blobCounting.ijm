run("Blobs (25K)");
setAutoThreshold("Otsu");
run("Set Measurements...", "area mean modal integrated redirect=None decimal=2");
run("Analyze Particles...", "size=0-Infinity circularity=0.20-1.00 show=Outlines display exclude clear include");

