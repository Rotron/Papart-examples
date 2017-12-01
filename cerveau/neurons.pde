import fr.inria.papart.procam.ColorDetection;
import fr.inria.papart.utils.MathUtils;
import fr.inria.papart.utils.*;
import fr.inria.papart.multitouch.detection.*;
import fr.inria.papart.multitouch.*;
import fr.inria.papart.multitouch.tracking.*;
import fr.inria.papart.calibration.*;
import fr.inria.papart.calibration.files.*;

public class NeronZone  extends PaperTouchScreen {

    int w = 300;
    int h = 210;
    ColorTracker colorTracker;
    
      Skatolo skatoloInside;
    
    public void settings(){
        setDrawingSize(w, h);
        loadMarkerBoard(Papart.markerFolder + "A4-default.svg", w, h);
        setDrawOnPaper();
    }

    public void setup() {
	colorTracker = papart.initRedTracking(this, 1f);
	// colorTracker = papart.initBlueTracking(this, 0.5f);

	// skatoloInside = new Skatolo(parent, this);
	// skatoloInside.setAutoDraw(false);
	// skatoloInside.getMousePointer().disable();
    }

    public void drawOnPaper() {
        background(40, 40, 40, 80);
        fill(200, 100, 20);

	ArrayList<TrackedElement> te = colorTracker.findColor(millis());
	TouchList touchs = colorTracker.getTouchList();
	
    // Draw the touch found by the tracker. 
	fill(0, 100, 100);
	for (Touch t : touchs) {
	    ellipse(t.position.x, t.position.y, 10, 10);
	    text(t.id, t.position.x, t.position.y);
	}
	

	// Touch mouse = createTouchFromMouse();
	// touchs.add(mouse);
	// SkatoloLink.updateTouch(touchs, skatoloInside); 
	
	// // Draw the pointers. (debug)
	// for (tech.lity.rea.skatolo.gui.Pointer p : skatoloInside.getPointerList()) {
	//     fill(0, 200, 0);
	//     rect(p.getX(), p.getY(), 3, 3);
	// }

	// // draw the GUI.
	// skatoloInside.draw(getGraphics());

    }
}
