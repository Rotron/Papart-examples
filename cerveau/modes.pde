public class ModesZone  extends PaperScreen {
    int w = 150;
    int h = 170;
    
    public void settings(){
        setDrawingSize(w, h);
        loadMarkerBoard(sketchPath() + "/markers/modes.svg", w, h);
        setDrawOnPaper();
    }

    public void setup() {

    }

    public void drawOnPaper() {
        background(40, 240, 240);
        fill(200, 100, 20);
        rect(10, 10, 100, 30);
    }
}
