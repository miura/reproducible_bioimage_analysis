# box1-2: Thresholding and Intensity measurements with single channel

Kota Miura

## Instruction

Run the macro on Fiji after adjusting the path to the sample image (). The figure will be regenerated from this source sample image.  


## Resources

### Image Data

### Software

Only one software was used for creating this figure. 

#### Fiji

- Fiji distribution of ImageJ, acquired from the following download link. OSX, 64-bit version was installed. 
  - https://imagej.net/Fiji/Downloads

##### setup details 

```
  java.version: 1.8.0_121
  java.vendor: Oracle Corporation
  os.name: Mac OS X
  os.version: 10.11.6
  os.arch: x86_64
  file.separator: /
  path.separator: :
  line.separator: <lf>

  user.name: miura
  user.home: /Users/miura
  user.dir: /Applications/Fiji.app
  user.country: US
  file.encoding: UTF-8
  java.home: /Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home/jre
  java.class.path: /Applications/Fiji.app/jars/imagej-launcher-4.0.5.jar
  java.ext.dirs: /Applications/Fiji.app/java/macosx-java3d/Home/lib/ext:/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home/jre/jre/lib/ext:/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home/jre/lib/ext:/Library/Java/Extensions:/System/Library/Java/Extensions:/System/Library/Frameworks/JavaVM.framework/Home/lib/ext
  java.io.tmpdir: /var/folders/tz/kbnr321x74d9n23hvxxv0p_w0000gp/T/

  IJ.getVersion: 2.0.0-rc-61/1.51n
  IJ.getFullVersion: 1.51n99
  IJ.isJava17: true
  IJ.isJava18: true
  IJ.isLinux: false
  IJ.isMacintosh: true
  IJ.isMacOSX: true
  IJ.isWindows: false
  IJ.is64Bit: true

  IJ.getDir("imagej"): /Applications/Fiji.app/
  IJ.getDir("home"): /Users/miura/
  IJ.getDir("plugins"): /Applications/Fiji.app/plugins/
  IJ.getDir("macros"): /Applications/Fiji.app/macros/
  IJ.getDir("luts"): /Applications/Fiji.app/luts/
  IJ.getDir("current"): /Users/miura/Google Drive/NeuBIAS/WG6/2017_EMBO_IA_Integrity/box1-2/
  IJ.getDir("temp"): /tmp/
  IJ.getDir("default"): /Users/miura/Google Drive/NeuBIAS/WG6/2017_EMBO_IA_Integrity/box1-2/
  IJ.getDir("image"): null

  Menus.getPlugInsPath: /Applications/Fiji.app/plugins/
  Menus.getMacrosPath: /Applications/Fiji.app/macros/
  Prefs.getImageJDir: /Applications/Fiji.app/
  Prefs.getThreads: 24 (24 cores)
  Prefs.open100Percent: false
  Prefs.blackBackground: true
  Prefs.useJFileChooser: false
  Prefs.weightedColor: false
  Prefs.blackCanvas: false
  Prefs.pointAutoMeasure: false
  Prefs.pointAutoNextSlice: false
  Prefs.requireControlKey: false
  Prefs.useInvertingLut: false
  Prefs.antialiasedTools: true
  Prefs.useInvertingLut: false
  Prefs.intelByteOrder: false
  Prefs.doubleBuffer: true
  Prefs.noPointLabels: false
  Prefs.disableUndo: false
  Prefs dir: /Users/miura/Library/Preferences
  Current dir: <>
  Memory in use: 148MB of 18036MB (<1%)
  Screen size: 1920x1080
  Max window bounds: x=0,y=23,width=1920,height=979
  Monitor1: x=0,y=0,width=1920,height=1080
  Monitor2: x=-1050,y=0,width=1050,height=1680

All Java Properties
  ij.dir: /Applications/Fiji.app
  java.runtime.name: Java(TM) SE Runtime Environment
  fiji.dir: /Applications/Fiji.app
  imagej.dir: /Applications/Fiji.app
  sun.boot.library.path: /Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home/jre/lib
  java.vm.version: 25.121-b13
  user.country.format: US_POSIX
  gopherProxySet: false
  java.vm.vendor: Oracle Corporation
  java.vendor.url: http://java.oracle.com/
  path.separator: :
  java.vm.name: Java HotSpot(TM) 64-Bit Server VM
  file.encoding.pkg: sun.io
  user.country: US
  sun.os.patch.level: unknown
  java.vm.specification.name: Java Virtual Machine Specification
  user.dir: /Applications/Fiji.app
  java.runtime.version: 1.8.0_121-b13
  java.awt.graphicsenv: sun.awt.CGraphicsEnvironment
  java.endorsed.dirs: /Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home/jre/lib/endorsed
  os.arch: x86_64
  java.io.tmpdir: /var/folders/tz/kbnr321x74d9n23hvxxv0p_w0000gp/T/
  line.separator: 

  java.vm.specification.vendor: Oracle Corporation
  os.name: Mac OS X
  sun.jnu.encoding: UTF-8
  java.library.path: /Applications/Fiji.app/lib/macosx:/Applications/Fiji.app/mm/macosx
  sun.awt.enableExtraMouseButtons: true
  java.specification.name: Java Platform API Specification
  java.class.version: 52.0
  sun.management.compiler: HotSpot 64-Bit Tiered Compilers
  os.version: 10.11.6
  http.nonProxyHosts: local|*.local|169.254/16|*.169.254/16
  user.home: /Users/miura
  user.timezone: Europe/Berlin
  java.awt.printerjob: sun.lwawt.macosx.CPrinterJob
  file.encoding: UTF-8
  java.specification.version: 1.8
  plugins.dir: /Applications/Fiji.app
  java.class.path: /Applications/Fiji.app/jars/imagej-launcher-4.0.5.jar
  user.name: miura
  java.vm.specification.version: 1.8
  java.home: /Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home/jre
  sun.arch.data.model: 64
  user.language: en
  java.specification.vendor: Oracle Corporation
  awt.toolkit: sun.lwawt.macosx.LWCToolkit
  java.vm.info: mixed mode
  java.version: 1.8.0_121
  java.ext.dirs: /Applications/Fiji.app/java/macosx-java3d/Home/lib/ext:/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home/jre/jre/lib/ext:/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home/jre/lib/ext:/Library/Java/Extensions:/System/Library/Java/Extensions:/System/Library/Frameworks/JavaVM.framework/Home/lib/ext
  sun.boot.class.path: /Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home/jre/lib/resources.jar:/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home/jre/lib/rt.jar:/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home/jre/lib/sunrsasign.jar:/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home/jre/lib/jsse.jar:/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home/jre/lib/jce.jar:/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home/jre/lib/charsets.jar:/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home/jre/lib/jfr.jar:/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home/jre/classes
  java.vendor: Oracle Corporation
  ij.executable: /Applications/Fiji.app/Contents/MacOS/ImageJ-macosx
  python.cachedir.skip: true
  file.separator: /
  java.vendor.url.bug: http://bugreport.sun.com/bugreport/
  sun.font.fontmanager: sun.font.CFontManager
  sun.io.unicode.encoding: UnicodeBig
  sun.cpu.endian: little
  socksNonProxyHosts: local|*.local|169.254/16|*.169.254/16
  fiji.executable: /Applications/Fiji.app/Contents/MacOS/ImageJ-macosx
  ftp.nonProxyHosts: local|*.local|169.254/16|*.169.254/16
  sun.cpu.isalist: 
```



