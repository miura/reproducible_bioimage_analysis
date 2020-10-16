import PSF_Generator, PSFGenerator
from psfgenerator import CollectionPSF, MainPanel
from bilib.commons.settings import Settings
from bilib.commons.job import ExecutionMode
from java.util import HashMap


# PSF generation

### path to the condiguration file needs to be checked and adjusted depending on your installation. 
config = '/Users/miura/Downloads/config.txt'

### matlab usage translated into jython script. 
### matlab = PSFGenerator.compute('/Users/miura/Downloads/config.txt')

types = [ "32-bits", "8-bits", "16-bits" ]
#ArrayList<PSF> 
psfs = CollectionPSF.getStandardCollection()
#MainPanel 
panel = MainPanel(Settings("PSFGenerator", config), HashMap(), psfs, None, types, None)
panel.compute(ExecutionMode.MULTITHREAD_NO)
#PSF 
psf = panel.getLastPSF()
selectedtype = panel.getSelectedType()
#ImagePlus 
imp = PSF_Generator().createImagePlus(psf, selectedtype)
imp.show()

