import fr.inria.papart.procam.ColorDetection;

int ech = 512; // power of 2
int freq = 30;

public class ColorApp extends PaperScreen {

  ColorDetection colorDetection;
  TrackedView boardView;

  // 5cm
  PVector captureSize = new PVector(10, 10);
  PVector origin = new PVector(100, 100);
  int picSize = 64; // Works better with power  of 2

  void settings() {
    setDrawingSize(297, 210);
    loadMarkerBoard(Papart.markerFolder + "A4-default.svg", 297, 210);
  }

  void setup() {
    colorDetection = new ColorDetection((PaperScreen) this);
    colorDetection.setPosition(origin);
    colorDetection.setCaptureSize(captureSize);
    colorDetection.setPicSize(picSize, picSize);
    colorDetection.init();

    colorDetection.initBlinkTracker(freq, 0.25f, ech);


    useAlt(false);
    setLoadKey("l");
    setSaveKey("s");
    setTrackKey("f");
    setSaveName("loc.xml");
  }

  void drawOnPaper() {
    clear();

    background(100, 100);
    // Compute the color from the pixels. 
    //    colorDetection.computeColor();

    colorDetection.recordBlinkRate();

    if(test){
	colorDetection.findBlinkRate();
	// re = colorDetection.re();
	// im = colorDetection.im();

	rer = colorDetection.rer();
	imr = colorDetection.imr();
	reg = colorDetection.reg();
	img = colorDetection.img();

    }
    // Get the result.
    int c = colorDetection.getColor();

    fill(c);

    int nbfound = colorDetection.computeOccurencesOfColor(c, 10);
    // println("We found: " + nbfound + " pixels of this color.");

    // For visual debugging.
    colorDetection.drawSelf();
  }
}
