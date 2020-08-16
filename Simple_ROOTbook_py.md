# Simple ROOTbook (Python)
<hr style="border-top-width: 4px; border-top-color: #34609b;">
This simple ROOTbook shows how to create a [histogram](https://root.cern.ch/doc/master/classTH1F.html), [fill it](https://root.cern.ch/doc/master/classTH1.html#a77e71290a82517d317ea8d05e96b6c4a) and [draw it](https://root.cern.ch/doc/master/classTH1.html#aa53a024a9e94d5ec91e3ef49e49563da).

Let's start importing the [ROOT](https://root.cern.ch) module, which gives us access to all [ROOT](https://root.cern.ch) classes.


```python
import ROOT
```

    Welcome to JupyROOT 6.12/06


In order to activate the interactive visualisation we can use the [JSROOT](https://root.cern.ch/js/) magic:


```python
%jsroot on
```

Now we will create a [histogram](https://root.cern.ch/doc/master/classTH1F.html) specifying its title and axes titles:



```python
h = ROOT.TH1F("myHisto","My Histo;X axis;Y axis",64, -4, 4)
```

Time to create a random generator and fill our histogram:


```python
rndmGenerator = ROOT.TRandom3()
for i in xrange(1000):
    rndm = rndmGenerator.Gaus()
    h.Fill(rndm)
```

We can now draw the histogram. We will at first create a [canvas](https://root.cern.ch/doc/master/classTCanvas.html), the entity which in ROOT holds graphics primitives. Note that thanks to [JSROOT](https://root.cern.ch/js/), this is not a static plot but an interactive visualisation. Try to play with it and save it as image when you are satisfied!


```python
c = ROOT.TCanvas()
h.Draw()
c.Draw()
```



<div id="root_plot_1"
     style="width: 696px; height: 472px">
</div>

<script>
 requirejs.config({
     paths: {
       'JSRootCore' : 'https://root.cern.ch/js/notebook//scripts/JSRootCore',
     }
   });
 require(['JSRootCore'],
     function(Core) {
       var obj = Core.JSONR_unref({"_typename":"TCanvas","fUniqueID":0,"fBits":53673992,"fLineColor":1,"fLineStyle":1,"fLineWidth":1,"fFillColor":0,"fFillStyle":1001,"fLeftMargin":0.1,"fRightMargin":0.1,"fBottomMargin":0.1,"fTopMargin":0.1,"fXfile":2,"fYfile":2,"fAfile":1,"fXstat":0.99,"fYstat":0.99,"fAstat":2,"fFrameFillColor":0,"fFrameLineColor":1,"fFrameFillStyle":1001,"fFrameLineStyle":1,"fFrameLineWidth":1,"fFrameBorderSize":1,"fFrameBorderMode":0,"fX1":-5.00000007450581,"fY1":-7.74375057695437,"fX2":5.00000007450581,"fY2":69.6937505769544,"fXtoAbsPixelk":348.00005,"fXtoPixelk":348.00005,"fXtoPixel":69.5999989628791,"fYtoAbsPixelk":424.800047186661,"fYtoPixelk":424.800047186661,"fYtoPixel":-6.09523800441197,"fUtoAbsPixelk":5e-5,"fUtoPixelk":5e-5,"fUtoPixel":696,"fVtoAbsPixelk":472.00005,"fVtoPixelk":472,"fVtoPixel":-472,"fAbsPixeltoXk":-5.00000007450581,"fPixeltoXk":-5.00000007450581,"fPixeltoX":0.0143678163060512,"fAbsPixeltoYk":69.6937505769544,"fPixeltoYk":-7.74375057695437,"fPixeltoY":-0.164062502444722,"fXlowNDC":0,"fYlowNDC":0,"fXUpNDC":0,"fYUpNDC":0,"fWNDC":1,"fHNDC":1,"fAbsXlowNDC":0,"fAbsYlowNDC":0,"fAbsWNDC":1,"fAbsHNDC":1,"fUxmin":-4,"fUymin":0,"fUxmax":4,"fUymax":61.95,"fTheta":30,"fPhi":30,"fAspectRatio":0,"fNumber":0,"fTickx":0,"fTicky":0,"fLogx":0,"fLogy":0,"fLogz":0,"fPadPaint":0,"fCrosshair":0,"fCrosshairPos":0,"fBorderSize":2,"fBorderMode":0,"fModified":false,"fGridx":false,"fGridy":false,"fAbsCoord":false,"fEditable":true,"fFixedAspectRatio":false,"fPrimitives":{"_typename":"TList","name":"TList","arr":[{"_typename":"TFrame","fUniqueID":0,"fBits":50331656,"fLineColor":1,"fLineStyle":1,"fLineWidth":1,"fFillColor":0,"fFillStyle":1001,"fX1":-4,"fY1":0,"fX2":4,"fY2":61.95,"fBorderSize":1,"fBorderMode":0},{"_typename":"TH1F","fUniqueID":0,"fBits":50331656,"fName":"myHisto","fTitle":"My Histo","fLineColor":602,"fLineStyle":1,"fLineWidth":1,"fFillColor":0,"fFillStyle":1001,"fMarkerColor":1,"fMarkerStyle":1,"fMarkerSize":1,"fNcells":66,"fXaxis":{"_typename":"TAxis","fUniqueID":0,"fBits":50331648,"fName":"xaxis","fTitle":"X axis","fNdivisions":510,"fAxisColor":1,"fLabelColor":1,"fLabelFont":42,"fLabelOffset":0.005,"fLabelSize":0.035,"fTickLength":0.03,"fTitleOffset":1,"fTitleSize":0.035,"fTitleColor":1,"fTitleFont":42,"fNbins":64,"fXmin":-4,"fXmax":4,"fXbins":[],"fFirst":0,"fLast":0,"fBits2":0,"fTimeDisplay":false,"fTimeFormat":"","fLabels":null,"fModLabs":null},"fYaxis":{"_typename":"TAxis","fUniqueID":0,"fBits":50331648,"fName":"yaxis","fTitle":"Y axis","fNdivisions":510,"fAxisColor":1,"fLabelColor":1,"fLabelFont":42,"fLabelOffset":0.005,"fLabelSize":0.035,"fTickLength":0.03,"fTitleOffset":0,"fTitleSize":0.035,"fTitleColor":1,"fTitleFont":42,"fNbins":1,"fXmin":0,"fXmax":1,"fXbins":[],"fFirst":0,"fLast":0,"fBits2":0,"fTimeDisplay":false,"fTimeFormat":"","fLabels":null,"fModLabs":null},"fZaxis":{"_typename":"TAxis","fUniqueID":0,"fBits":50331648,"fName":"zaxis","fTitle":"","fNdivisions":510,"fAxisColor":1,"fLabelColor":1,"fLabelFont":42,"fLabelOffset":0.005,"fLabelSize":0.035,"fTickLength":0.03,"fTitleOffset":1,"fTitleSize":0.035,"fTitleColor":1,"fTitleFont":42,"fNbins":1,"fXmin":0,"fXmax":1,"fXbins":[],"fFirst":0,"fLast":0,"fBits2":0,"fTimeDisplay":false,"fTimeFormat":"","fLabels":null,"fModLabs":null},"fBarOffset":0,"fBarWidth":1000,"fEntries":1000,"fTsumw":1000,"fTsumw2":1000,"fTsumwx":26.8014110408005,"fTsumwx2":1077.8558772549,"fMaximum":-1111,"fMinimum":-1111,"fNormFactor":0,"fContour":[],"fSumw2":[],"fOption":"","fFunctions":{"_typename":"TList","name":"TList","arr":[{"_typename":"TPaveStats","fUniqueID":0,"fBits":50331657,"fLineColor":1,"fLineStyle":1,"fLineWidth":1,"fFillColor":0,"fFillStyle":1001,"fX1":2.8000002026558,"fY1":52.2703132788884,"fX2":4.80000026226044,"fY2":64.6603131865757,"fX1NDC":0.780000016093254,"fY1NDC":0.775000005960464,"fX2NDC":0.980000019073486,"fY2NDC":0.935000002384186,"fBorderSize":1,"fInit":1,"fShadowColor":1,"fCornerRadius":0,"fOption":"brNDC","fName":"stats","fTextAngle":0,"fTextSize":0,"fTextAlign":12,"fTextColor":1,"fTextFont":42,"fLabel":"","fLongest":18,"fMargin":0.05,"fLines":{"_typename":"TList","name":"TList","arr":[{"_typename":"TLatex","fUniqueID":0,"fBits":50331648,"fName":"","fTitle":"myHisto","fTextAngle":0,"fTextSize":0.0368,"fTextAlign":0,"fTextColor":0,"fTextFont":0,"fX":0,"fY":0,"fLineColor":1,"fLineStyle":1,"fLineWidth":2,"fLimitFactorSize":3,"fOriginSize":0.0368000008165836},{"_typename":"TLatex","fUniqueID":0,"fBits":50331648,"fName":"","fTitle":"Entries = 1000   ","fTextAngle":0,"fTextSize":0,"fTextAlign":0,"fTextColor":0,"fTextFont":0,"fX":0,"fY":0,"fLineColor":1,"fLineStyle":1,"fLineWidth":2,"fLimitFactorSize":3,"fOriginSize":0.04},{"_typename":"TLatex","fUniqueID":0,"fBits":50331648,"fName":"","fTitle":"Mean  = 0.0268","fTextAngle":0,"fTextSize":0,"fTextAlign":0,"fTextColor":0,"fTextFont":0,"fX":0,"fY":0,"fLineColor":1,"fLineStyle":1,"fLineWidth":2,"fLimitFactorSize":3,"fOriginSize":0.04},{"_typename":"TLatex","fUniqueID":0,"fBits":50331648,"fName":"","fTitle":"Std Dev   =  1.038","fTextAngle":0,"fTextSize":0,"fTextAlign":0,"fTextColor":0,"fTextFont":0,"fX":0,"fY":0,"fLineColor":1,"fLineStyle":1,"fLineWidth":2,"fLimitFactorSize":3,"fOriginSize":0.04}],"opt":["","","",""]},"fOptFit":0,"fOptStat":1111,"fFitFormat":"5.4g","fStatFormat":"6.4g","fParent":{"$ref":3}}],"opt":["brNDC"]},"fBufferSize":0,"fBuffer":[],"fBinStatErrOpt":0,"fArray":[0,0,1,0,0,0,0,0,0,1,0,2,2,5,4,7,5,7,11,11,13,23,16,25,23,29,39,34,33,50,57,47,59,58,36,46,41,32,29,39,34,28,30,29,18,10,13,18,5,6,7,7,2,3,1,1,2,0,0,0,1,0,0,0,0,0]},{"_typename":"TPaveText","fUniqueID":0,"fBits":50331657,"fLineColor":1,"fLineStyle":1,"fLineWidth":1,"fFillColor":0,"fFillStyle":0,"fX1":-0.818390816792675,"fY1":64.5815633700276,"fX2":0.818390816792676,"fY2":69.3065634404356,"fX1NDC":0.41816091954023,"fY1NDC":0.933983055615829,"fX2NDC":0.58183908045977,"fY2NDC":0.995000004768372,"fBorderSize":0,"fInit":1,"fShadowColor":1,"fCornerRadius":0,"fOption":"blNDC","fName":"title","fTextAngle":0,"fTextSize":0,"fTextAlign":22,"fTextColor":1,"fTextFont":42,"fLabel":"","fLongest":8,"fMargin":0.05,"fLines":{"_typename":"TList","name":"TList","arr":[{"_typename":"TLatex","fUniqueID":0,"fBits":50331648,"fName":"","fTitle":"My Histo","fTextAngle":0,"fTextSize":0,"fTextAlign":0,"fTextColor":0,"fTextFont":0,"fX":0,"fY":0,"fLineColor":1,"fLineStyle":1,"fLineWidth":2,"fLimitFactorSize":3,"fOriginSize":0.0518644079566002}],"opt":[""]}}],"opt":["","","blNDC"]},"fExecs":null,"fName":"c1","fTitle":"c1","fNumPaletteColor":0,"fNextPaletteColor":0,"fDISPLAY":"$DISPLAY","fDoubleBuffer":0,"fRetained":true,"fXsizeUser":0,"fYsizeUser":0,"fXsizeReal":20,"fYsizeReal":14.28571,"fWindowTopX":0,"fWindowTopY":0,"fWindowWidth":0,"fWindowHeight":0,"fCw":696,"fCh":472,"fCatt":{"_typename":"TAttCanvas","fXBetween":2,"fYBetween":2,"fTitleFromTop":1.2,"fXdate":0.2,"fYdate":0.3,"fAdate":1},"kMoveOpaque":true,"kResizeOpaque":true,"fHighLightColor":2,"fBatch":true,"kShowEventStatus":false,"kAutoExec":true,"kMenuBar":true});
       Core.draw("root_plot_1", obj, "");
     }
 );
</script>



We'll try now to beautify the plot a bit, for example filling the histogram with a colour and setting a grid on the canvas.


```python
h.SetFillColor(ROOT.kBlue-10)
c.SetGrid()
h.Draw()
c.Draw()
```



<div id="root_plot_2"
     style="width: 696px; height: 472px">
</div>

<script>
 requirejs.config({
     paths: {
       'JSRootCore' : 'https://root.cern.ch/js/notebook//scripts/JSRootCore',
     }
   });
 require(['JSRootCore'],
     function(Core) {
       var obj = Core.JSONR_unref({"_typename":"TCanvas","fUniqueID":0,"fBits":53673992,"fLineColor":1,"fLineStyle":1,"fLineWidth":1,"fFillColor":0,"fFillStyle":1001,"fLeftMargin":0.1,"fRightMargin":0.1,"fBottomMargin":0.1,"fTopMargin":0.1,"fXfile":2,"fYfile":2,"fAfile":1,"fXstat":0.99,"fYstat":0.99,"fAstat":2,"fFrameFillColor":0,"fFrameLineColor":1,"fFrameFillStyle":1001,"fFrameLineStyle":1,"fFrameLineWidth":1,"fFrameBorderSize":1,"fFrameBorderMode":0,"fX1":-5.00000007450581,"fY1":-7.74375057695437,"fX2":5.00000007450581,"fY2":69.6937505769544,"fXtoAbsPixelk":348.00005,"fXtoPixelk":348.00005,"fXtoPixel":69.5999989628791,"fYtoAbsPixelk":424.800047186661,"fYtoPixelk":424.800047186661,"fYtoPixel":-6.09523800441197,"fUtoAbsPixelk":5e-5,"fUtoPixelk":5e-5,"fUtoPixel":696,"fVtoAbsPixelk":472.00005,"fVtoPixelk":472,"fVtoPixel":-472,"fAbsPixeltoXk":-5.00000007450581,"fPixeltoXk":-5.00000007450581,"fPixeltoX":0.0143678163060512,"fAbsPixeltoYk":69.6937505769544,"fPixeltoYk":-7.74375057695437,"fPixeltoY":-0.164062502444722,"fXlowNDC":0,"fYlowNDC":0,"fXUpNDC":0,"fYUpNDC":0,"fWNDC":1,"fHNDC":1,"fAbsXlowNDC":0,"fAbsYlowNDC":0,"fAbsWNDC":1,"fAbsHNDC":1,"fUxmin":-4,"fUymin":0,"fUxmax":4,"fUymax":61.95,"fTheta":30,"fPhi":30,"fAspectRatio":0,"fNumber":0,"fTickx":0,"fTicky":0,"fLogx":0,"fLogy":0,"fLogz":0,"fPadPaint":0,"fCrosshair":0,"fCrosshairPos":0,"fBorderSize":2,"fBorderMode":0,"fModified":false,"fGridx":true,"fGridy":true,"fAbsCoord":false,"fEditable":true,"fFixedAspectRatio":false,"fPrimitives":{"_typename":"TList","name":"TList","arr":[{"_typename":"TFrame","fUniqueID":0,"fBits":50331656,"fLineColor":1,"fLineStyle":1,"fLineWidth":1,"fFillColor":0,"fFillStyle":1001,"fX1":-4,"fY1":0,"fX2":4,"fY2":61.95,"fBorderSize":1,"fBorderMode":0},{"_typename":"TH1F","fUniqueID":0,"fBits":50331656,"fName":"myHisto","fTitle":"My Histo","fLineColor":602,"fLineStyle":1,"fLineWidth":1,"fFillColor":590,"fFillStyle":1001,"fMarkerColor":1,"fMarkerStyle":1,"fMarkerSize":1,"fNcells":66,"fXaxis":{"_typename":"TAxis","fUniqueID":0,"fBits":50331648,"fName":"xaxis","fTitle":"X axis","fNdivisions":510,"fAxisColor":1,"fLabelColor":1,"fLabelFont":42,"fLabelOffset":0.005,"fLabelSize":0.035,"fTickLength":0.03,"fTitleOffset":1,"fTitleSize":0.035,"fTitleColor":1,"fTitleFont":42,"fNbins":64,"fXmin":-4,"fXmax":4,"fXbins":[],"fFirst":0,"fLast":0,"fBits2":0,"fTimeDisplay":false,"fTimeFormat":"","fLabels":null,"fModLabs":null},"fYaxis":{"_typename":"TAxis","fUniqueID":0,"fBits":50331648,"fName":"yaxis","fTitle":"Y axis","fNdivisions":510,"fAxisColor":1,"fLabelColor":1,"fLabelFont":42,"fLabelOffset":0.005,"fLabelSize":0.035,"fTickLength":0.03,"fTitleOffset":0,"fTitleSize":0.035,"fTitleColor":1,"fTitleFont":42,"fNbins":1,"fXmin":0,"fXmax":1,"fXbins":[],"fFirst":0,"fLast":0,"fBits2":0,"fTimeDisplay":false,"fTimeFormat":"","fLabels":null,"fModLabs":null},"fZaxis":{"_typename":"TAxis","fUniqueID":0,"fBits":50331648,"fName":"zaxis","fTitle":"","fNdivisions":510,"fAxisColor":1,"fLabelColor":1,"fLabelFont":42,"fLabelOffset":0.005,"fLabelSize":0.035,"fTickLength":0.03,"fTitleOffset":1,"fTitleSize":0.035,"fTitleColor":1,"fTitleFont":42,"fNbins":1,"fXmin":0,"fXmax":1,"fXbins":[],"fFirst":0,"fLast":0,"fBits2":0,"fTimeDisplay":false,"fTimeFormat":"","fLabels":null,"fModLabs":null},"fBarOffset":0,"fBarWidth":1000,"fEntries":1000,"fTsumw":1000,"fTsumw2":1000,"fTsumwx":26.8014110408005,"fTsumwx2":1077.8558772549,"fMaximum":-1111,"fMinimum":-1111,"fNormFactor":0,"fContour":[],"fSumw2":[],"fOption":"","fFunctions":{"_typename":"TList","name":"TList","arr":[{"_typename":"TPaveStats","fUniqueID":0,"fBits":50331657,"fLineColor":1,"fLineStyle":1,"fLineWidth":1,"fFillColor":0,"fFillStyle":1001,"fX1":2.8000002026558,"fY1":52.2703132788884,"fX2":4.80000026226044,"fY2":64.6603131865757,"fX1NDC":0.780000016093254,"fY1NDC":0.775000005960464,"fX2NDC":0.980000019073486,"fY2NDC":0.935000002384186,"fBorderSize":1,"fInit":1,"fShadowColor":1,"fCornerRadius":0,"fOption":"brNDC","fName":"stats","fTextAngle":0,"fTextSize":0,"fTextAlign":12,"fTextColor":1,"fTextFont":42,"fLabel":"","fLongest":18,"fMargin":0.05,"fLines":{"_typename":"TList","name":"TList","arr":[{"_typename":"TLatex","fUniqueID":0,"fBits":50331648,"fName":"","fTitle":"myHisto","fTextAngle":0,"fTextSize":0.0368,"fTextAlign":0,"fTextColor":0,"fTextFont":0,"fX":0,"fY":0,"fLineColor":1,"fLineStyle":1,"fLineWidth":2,"fLimitFactorSize":3,"fOriginSize":0.0368000008165836},{"_typename":"TLatex","fUniqueID":0,"fBits":50331648,"fName":"","fTitle":"Entries = 1000   ","fTextAngle":0,"fTextSize":0,"fTextAlign":0,"fTextColor":0,"fTextFont":0,"fX":0,"fY":0,"fLineColor":1,"fLineStyle":1,"fLineWidth":2,"fLimitFactorSize":3,"fOriginSize":0.04},{"_typename":"TLatex","fUniqueID":0,"fBits":50331648,"fName":"","fTitle":"Mean  = 0.0268","fTextAngle":0,"fTextSize":0,"fTextAlign":0,"fTextColor":0,"fTextFont":0,"fX":0,"fY":0,"fLineColor":1,"fLineStyle":1,"fLineWidth":2,"fLimitFactorSize":3,"fOriginSize":0.04},{"_typename":"TLatex","fUniqueID":0,"fBits":50331648,"fName":"","fTitle":"Std Dev   =  1.038","fTextAngle":0,"fTextSize":0,"fTextAlign":0,"fTextColor":0,"fTextFont":0,"fX":0,"fY":0,"fLineColor":1,"fLineStyle":1,"fLineWidth":2,"fLimitFactorSize":3,"fOriginSize":0.04}],"opt":["","","",""]},"fOptFit":0,"fOptStat":1111,"fFitFormat":"5.4g","fStatFormat":"6.4g","fParent":{"$ref":3}}],"opt":["brNDC"]},"fBufferSize":0,"fBuffer":[],"fBinStatErrOpt":0,"fArray":[0,0,1,0,0,0,0,0,0,1,0,2,2,5,4,7,5,7,11,11,13,23,16,25,23,29,39,34,33,50,57,47,59,58,36,46,41,32,29,39,34,28,30,29,18,10,13,18,5,6,7,7,2,3,1,1,2,0,0,0,1,0,0,0,0,0]},{"_typename":"TPaveText","fUniqueID":0,"fBits":50331657,"fLineColor":1,"fLineStyle":1,"fLineWidth":1,"fFillColor":0,"fFillStyle":0,"fX1":-0.818390816792675,"fY1":64.5815633700276,"fX2":0.818390816792676,"fY2":69.3065634404356,"fX1NDC":0.41816091954023,"fY1NDC":0.933983055615829,"fX2NDC":0.58183908045977,"fY2NDC":0.995000004768372,"fBorderSize":0,"fInit":1,"fShadowColor":1,"fCornerRadius":0,"fOption":"blNDC","fName":"title","fTextAngle":0,"fTextSize":0,"fTextAlign":22,"fTextColor":1,"fTextFont":42,"fLabel":"","fLongest":8,"fMargin":0.05,"fLines":{"_typename":"TList","name":"TList","arr":[{"_typename":"TLatex","fUniqueID":0,"fBits":50331648,"fName":"","fTitle":"My Histo","fTextAngle":0,"fTextSize":0,"fTextAlign":0,"fTextColor":0,"fTextFont":0,"fX":0,"fY":0,"fLineColor":1,"fLineStyle":1,"fLineWidth":2,"fLimitFactorSize":3,"fOriginSize":0.0518644079566002}],"opt":[""]}}],"opt":["","","blNDC"]},"fExecs":null,"fName":"c1","fTitle":"c1","fNumPaletteColor":0,"fNextPaletteColor":0,"fDISPLAY":"$DISPLAY","fDoubleBuffer":0,"fRetained":true,"fXsizeUser":0,"fYsizeUser":0,"fXsizeReal":20,"fYsizeReal":14.28571,"fWindowTopX":0,"fWindowTopY":0,"fWindowWidth":0,"fWindowHeight":0,"fCw":696,"fCh":472,"fCatt":{"_typename":"TAttCanvas","fXBetween":2,"fYBetween":2,"fTitleFromTop":1.2,"fXdate":0.2,"fYdate":0.3,"fAdate":1},"kMoveOpaque":true,"kResizeOpaque":true,"fHighLightColor":2,"fBatch":true,"kShowEventStatus":false,"kAutoExec":true,"kMenuBar":true});
       Core.draw("root_plot_2", obj, "");
     }
 );
</script>



Alright: we are done with our first step into the ROOTbooks world!
