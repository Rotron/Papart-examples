import fr.inria.papart.tracking.DetectedMarker;

public class ModesZone  extends PaperScreen {
    int w = 150;
    int h = 170;
    
    public void settings(){
        setDrawingSize(w, h);
        loadMarkerBoard(sketchPath() + "/markers/modes.svg", w, h);
        setDrawOnPaper();
    }

    public void setup() {
	setSaveName("modes.xml");
	setLoadKey("m");
	setSaveKey("M");
    }

    int MARKER_WIDTH = 35;

    int background = 0;
    
    public void drawOnPaper() {
	// Main marker, with id 800 - 1000
	int id = getMainMarker(MARKER_WIDTH);
	if(id != -1){
	    //	    println("Marker found: "  + id);
	    colorMode(HSB, 10, 100, 100); // change hue
	    background(id - 800, 100, 100);
	}else {
	    colorMode(RGB, 255); // default
	    background(id - 800, 240, 240);
	}
    }
}
