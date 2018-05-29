// path needs to be adjusted for opening the source image from correct location. 
//open("/Users/miura/Google Drive/NeuBIAS/WG6/2017_EMBO_IA_Integrity/box1-2/Week1_150607_B02_s1_w107447158-AC76-4844-8431-E6A954BD1174.tif");


// factor to be used to increase the intensity of image
amplify_facor = 1.1;
th_method = "IsoData dark";

//amplify_factorA = newArray(1.05, 1.1, 1.15, 1.20, 1.25, 1.3, 1.35, 1.4, 1.45, 1.5);
amplify_factorA = newArray(20);
for (i = 0; i < amplify_factorA.length; i++)
    amplify_factorA[i] = 1.0 + 0.05 * (i+1);
    
th_methodA = newArray("Default", 
                        "Huang", 
                        "Intermodes",
                        "IsoData",
                        "IJ_IsoData",
                        "Li",
                        "MaxEntropy",
                        "Mean",
                        "Minimum",
                        "Moments",
                        "Otsu",
                        "Percentile",
                        "RenyiEntropy",
                        "Shanbhag",
                        "Triangle",
                        "Yen");

// cropping an arbiturary nuclues
//makeRectangle(809, 398, 76, 63);
//run("Duplicate...", " ");
//rename("crop.tif");

print("Method", "Factor", "area diff", "total int diff", "mean int diff");
for (j = 0; j < th_methodA.length; j++){
    //print("*** Method:", th_methodA[j], "***");
    
    for (i = 0; i < amplify_factorA.length; i++){
        //print("factor:", amplify_factorA[i]);
        testAmplify(th_methodA[j], amplify_factorA[i]);
    }
}

function testAmplify(th_method, amplify_facor){
    th_method = th_method + " dark";
    open("/Users/miura/Google Drive/NeuBIAS/WG6/2017_EMBO_IA_Integrity/github/box1-2/crop.tif");
    orgID = getImageID();    
    selectImage(orgID);
    run("Duplicate...", "title=crop110percent.tif");
    run("Multiply...", "value="+amplify_facor);
    
    // duplicating cropped image
    selectWindow("crop.tif");
    run("Duplicate...", "title=Threshold.tif");
    selectWindow("crop.tif");
    run("Duplicate...", "title=boundary.tif");
    selectWindow("crop110percent.tif");
    run("Duplicate...", "title=Threshold2.tif");
    selectWindow("crop110percent.tif");
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
    
//    print("");
//    print("**", th_method, amplify_facor, "**");
    //print("orig total\t", total1);
    //print("enhc expec\t", total1*amplify_facor);
    //print("enhc total\t", total2);
    //print("   area diff:",  area1-area2);    
    //print("   total intensity diff:",  total1*amplify_facor - total2);
    //print("   mean  intensity diff:",  mean1*amplify_facor - mean2);
    print(th_method, ",", 
          amplify_facor, ",",
          area1-area2,  ",", 
          total1*amplify_facor - total2,  ",", 
          mean1*amplify_facor - mean2);
 //   print("--");
 //   print("orig mean\t", mean1);
 //   print("enhc expec\t", mean1*amplify_facor);
 //   print("enhc meani\t", mean2);
    
    run("Close All");
}