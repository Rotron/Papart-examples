import fr.inria.papart.procam.camera.TrackedView;


public class InputZone  extends PaperScreen {

    int w = 150;
    int h = 220;

    TrackedView inputView;

    PVector captureSize = new PVector(50, 50);
    PVector origin = new PVector(22, 96);
    int picSize = 4; // Works better with power of 2
    
    public void settings(){
        setDrawingSize(w, h);
        loadMarkerBoard(sketchPath() + "/markers/lecture.svg", w, h);
        setDrawOnPaper();
    }

    public void setup() {

	setSaveName("input.xml");
	setLoadKey("i");
	setSaveKey("I");

	inputView = new TrackedView(this);
	inputView.setCaptureSizeMM(captureSize);
	inputView.setImageWidthPx(picSize);
	inputView.setImageHeightPx(picSize);
        inputView.setTopLeftCorner(origin);
	inputView.init();
    }

    public void drawOnPaper() {

        stroke(100);
        noFill();
        strokeWeight(2);

	line(0, 0, origin.x, origin.y);
	rect((int) origin.x, (int) origin.y,
             (int) captureSize.x, (int)captureSize.y);

        PImage out = inputView.getViewOf(this.getCameraTracking());

	if(out != null){
	    image(out, 0, 0, 50, 50);
	}

	
    }
}
