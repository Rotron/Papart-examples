import fr.inria.papart.procam.*;
import fr.inria.papart.multitouch.*;
import tech.lity.rea.svgextended.*;
import org.bytedeco.javacpp.*;
import org.reflections.*;
import processing.video.*;
import TUIO.*;
import toxi.geom.*;
import fr.inria.papart.depthcam.*;
import fr.inria.papart.procam.display.*;
import fr.inria.skatolo.Skatolo;

float renderQuality = 1.5f;
Papart papart;

void settings(){
    fullScreen(P3D);
}

 void setup(){
     papart = Papart.projection(this);
     papart.loadTouchInput();
     papart.loadSketches();
     papart.startTracking();
}


void draw(){
}

boolean test = false;

void keyPressed() {
    if(key == 't')
	test = !test;

    if(key == 's'){
	app.saveLocationTo("loc.xml");
    }
    if(key == 's'){
	app.loadLocationFrom("loc.xml");
    }

}
