int x=0;
float shrinkX= 600;
float shrinkY=600;
float shrinkic = 0;
float shrinkcirc = 0;
PImage homepage;
PImage art;
PImage science;
PImage trivia;
PImage arttop;
PImage sciencetop;
PImage triviatop;
int stage;
import com.onformative.leap.*;
import com.leapmotion.leap.*;
import com.leapmotion.leap.CircleGesture;
import com.leapmotion.leap.Gesture.State;
import com.leapmotion.leap.Gesture.Type;
import com.leapmotion.leap.Hand;
import com.leapmotion.leap.KeyTapGesture;
import com.leapmotion.leap.ScreenTapGesture;
import com.leapmotion.leap.SwipeGesture;
import com.onformative.leap.LeapMotionP5;
int opac = 100;
int state = 0;
int time = 0;
int counter = 0;
int counter1 = 0;
int random = 0;
LeapMotionP5 leap;
String lastGesture =
"enabling gestures: \n'c' for CircleGesture\n's' for SwipeGesture\n'k' for KeyTapGesture\n't' for ScreenTapGesture";




void setup() {
  size(600, 600, P3D);
  noFill();
  stroke(255);
  leap = new LeapMotionP5(this);
  leap.enableGesture(Type.TYPE_SWIPE);
  homepage = loadImage ("hompage.png");
  art = loadImage("art.png");
  science = loadImage("science.png");
  trivia = loadImage("trivia.png");
    arttop = loadImage("arttop.png");
  sciencetop = loadImage("sciencetop.png");
  triviatop = loadImage("triviatop.png");
}
void draw() {
  if (state == 0) {
    background(255);
    image (homepage, 0, 0, shrinkX, shrinkY);
    for (Hand hand : leap.getHandList ()) {
      PVector handPosition = leap.getPosition(hand);
      PVector handCenter = leap.getSphereCenter(hand);
      float handSize = leap.getSphereRadius(hand);
      fill(0, 255, 0);
      ellipse(handPosition.x, handPosition.y, 50, 50);
    }
    for (Finger f : leap.getFingerList ()) {
      PVector position = leap.getTip(f);
      PVector position2 = leap.getOrigin(f);
      PVector velocity = leap.getVelocity(f);
      float lengthF = leap.getLength(f);
      float widthF = leap.getWidth(f);
      PVector direc = leap.getDirection(f);
      fill(255, 0, 0);
      ellipse(position.x, position.y, 10, 10);
      fill(0, 0, 255);
      ellipse(position2.x, position2.y, 10, 10);
      fill(255);
      line(position.x, position.y, position2.x, position2.y);
      if (position.x<550.0 && position.x>50.0 && position.y<550.0 && position.y>50.0) {
        x=x+1;
        if (x>75) {
          shrinkX=shrinkX-25;
          shrinkY=shrinkY-25;
          shrinkic = shrinkic+9;
          pushMatrix();/////homepage////
          translate((width-shrinkX)/2, (height-shrinkY)/2);
          background(255);
          //ellipse(300,300,550-shrinkX,550-shrinkY);
          image (homepage, 0, 0, shrinkX, shrinkY);
          popMatrix();//////homepage
        }
        pushMatrix();////////ART
        translate((((width/2)-shrinkic)/2)-36, ((180-shrinkic)/2)+22);
        image (art, (width/2)-108, 72, shrinkic, shrinkic);
        popMatrix();/////////ART

        pushMatrix();//////SCIENCE  
        translate((((width/4)-shrinkic)/2)+36, ((180-shrinkic)/2)+22);
        image (science, (width/4)-108, height-288, shrinkic, shrinkic);      
        // popMatrix();//////SCIENCE
        // pushMatrix();////////TRIVIA
        image (trivia, ((.75*width))-108, height-288, shrinkic, shrinkic); 
        //popMatrix();///////TRIVIA
        popMatrix();//////SCIENCE
        if (shrinkX<0) {
          state = 1;
        }
      }
    }
  }

  if (state == 1) {
    background (255);
    fill(0,0,0);
    println(shrinkic);
    image (art, (width/2)-108, 72, shrinkic, shrinkic);
    image (science, (width/4)-108, height-288, shrinkic, shrinkic);
    image (trivia, ((3*width)/4)-108, height-288, shrinkic, shrinkic); 
    textSize(20);
    text("Trivia", 440, 500);
    text("Art", 290, 270);
    text("Science", 115, 500);

    for (Finger f : leap.getFingerList ()) {
      PVector position = leap.getTip(f);
      PVector position2 = leap.getOrigin(f);
      PVector velocity = leap.getVelocity(f);
      float lengthF = leap.getLength(f);
      float widthF = leap.getWidth(f);
      PVector direc = leap.getDirection(f);
      fill(255, 0, 0);
      ellipse(position.x, position.y, 10, 10);
      fill(0, 0, 255);
      ellipse(position2.x, position2.y, 10, 10);
      fill(0);
      stroke(0);
      line(position.x, position.y, position2.x, position2.y);
      fill(255);
      stroke(255);
      if (position.x<500.0 && position.x>440.0 && position.y<525.0 && position.y>475.0 && time<150) {
        time++;
        fill(255, 0, 0);
        text("Trivia", 440, 500);
        if (time>=150) {
          state = 2;
        }
      } else if (position.x<310.0 && position.x>290.0 && position.y<300.0 && position.y>240.0 && time<150) {
        time++;
        fill(255, 0, 0);
        text("Art", 290, 270);
        if (time>=150) {
          shrinkcirc = shrinkcirc+9;
        println("Running");
        image (art, (width/2)-108, 72, shrinkic, shrinkic);

        pushMatrix();////////ART
        //translate((((width/2)-shrinkcirc)/2)-36, ((180-shrinkcirc)/2)+22);
        fill(#0D77FF);
        stroke(#0D77FF);
        ellipse ((width/2)+5, 288-100, shrinkcirc, shrinkcirc);
        popMatrix();/////////ART

        image (arttop, (width/2)-108, 72, shrinkic, shrinkic);
        if (shrinkcirc >=216) {
          state = 49;/////go to art
        }
        }
      } else  if (position.x<170.0 && position.x>115.0 && position.y<525.0 && position.y>475.0 && time<150) {
        time++;
        fill(255, 0, 0);
        text("Science", 115, 500);
        if (time>=150) {
          state = 50;
        }
      }
    }
    for (Hand hand : leap.getHandList ()) {
      PVector handPosition = leap.getPosition(hand);
      PVector handCenter = leap.getSphereCenter(hand);
      float handSize = leap.getSphereRadius(hand);
      fill(0, 255, 0);
      ellipse(handPosition.x, handPosition.y, 50, 50);
    }
  }
  if (state == 8) {
    background(0, 0, 0);
    textSize(30);
    fill(255);
    text("TRIVIA", 230, 50);
    stateRun();
    time = 0;
    counter = 0;
    counter1 = 0;
    int picker = (int) random(0, 2);

    if (picker == 0) {
      state = 5;
    }
    if (picker == 1) {
      state = 6;
    }
  }
  
  if (state == 49) {///////art transition
    fill(#0D77FF);
    stroke(#0D77FF);
    ellipse ((width/2)+5, 288-100, shrinkcirc, shrinkcirc);
            image (arttop, (width/2)-108, 72, shrinkic, shrinkic);

    tint(255, opac);
    opac-=10;
    //stage = 3;/////go to art 
    shrinkcirc = shrinkcirc+9;
    
      if (shrinkcirc > 2.5*width){
     stage = 51;///////scicne page 
     opac =0100;
    }
  }

  if (state==5) {

    background(0);
    fill(255);
    textSize(30);
    text("TRIVIA", 230, 50);
    textSize(19);
    text("What was the name of the American secret Project with the", 5, 100);
    text("purpose of building the first atomic bomb in history?", 5, 125);
    text("Queens Project", 50, 200);
    text("Manhattan Project", 400, 200);
    text("Bronx Project", 50, 350);
    text("Staten Project", 400, 350);
    stateRun();
    for (Finger f : leap.getFingerList ()) {
      PVector position = leap.getTip(f);
      PVector position2 = leap.getOrigin(f);
      PVector velocity = leap.getVelocity(f);
      float lengthF = leap.getLength(f);
      float widthF = leap.getWidth(f);
      PVector direc = leap.getDirection(f);
      fill(255, 0, 0);
      ellipse(position.x, position.y, 10, 10);
      fill(0, 0, 255);
      ellipse(position2.x, position2.y, 10, 10);
      fill(255);
      line(position.x, position.y, position2.x, position2.y);

      if (position.x< 125 && position.x>50 && position.y<225 && position.y>175 && time<150) {
        fill(255, 0, 0);
        text("Queens Project", 50, 200);
        time ++;
        if (time>=150) {
          state = 99;
        }
      }

      if (position.x< 475 && position.x>400 && position.y<225 && position.y>175 && time<150) {
        fill(255, 0, 0);
        text("Manhattan Project", 400, 200);
        time ++;
        if (time>=150) {
          state = 100;
        }
      }

      if (position.x< 125 && position.x>50 && position.y<375 && position.y>325 && time<150) {
        fill(255, 0, 0);
        text("Bronx Project", 50, 350);
        time ++;
        if (time>=150) {
          state = 99;
        }
      }

      if (position.x< 475 && position.x>400 && position.y<375 && position.y>325 && time<150) {
        fill(255, 0, 0);
        text("Staten Project", 400, 350);
        time ++;
        if (time>=150) {
          state = 99;
        }
      }
    }
  }


  if (state==6) {

    background(0);
    fill(255);
    textSize(30);
    text("TRIVIA", 230, 50);
    textSize(18);
    text("Who are the three sons of Chronos", 5, 100);
    text("Poseidon, Hades, and Zeus", 20, 200);
    text("Lebron, Dwayne, and Chris", 325, 200);
    text("Jupiter, Jove, and Acteon", 20, 350);
    text("Demetrius, Stavros, and Oedipus", 325, 350);
    stateRun();
    for (Finger f : leap.getFingerList ()) {
      PVector position = leap.getTip(f);
      PVector position2 = leap.getOrigin(f);
      PVector velocity = leap.getVelocity(f);
      float lengthF = leap.getLength(f);
      float widthF = leap.getWidth(f);
      PVector direc = leap.getDirection(f);
      fill(255, 0, 0);
      ellipse(position.x, position.y, 10, 10);
      fill(0, 0, 255);
      ellipse(position2.x, position2.y, 10, 10);
      fill(255);
      line(position.x, position.y, position2.x, position2.y);

      if (position.x< 125 && position.x>20 && position.y<225 && position.y>175 && time<150) {
        fill(255, 0, 0);
        text("Poseidon, Hades, and Zeus", 20, 200);
        time ++;
        if (time>=150) {
          state = 100;
        }
      }

      if (position.x< 475 && position.x>325 && position.y<225 && position.y>175 && time<150) {
        fill(255, 0, 0);
        text("Lebron, Dwayne, and Chris", 325, 200);
        time ++;
        if (time>=150) {
          state = 99;
        }
      }

      if (position.x< 125 && position.x>20 && position.y<375 && position.y>325 && time<150) {
        fill(255, 0, 0);
        text("Jupiter, Jove, and Acteon", 20, 350);
        time ++;
        if (time>=150) {
          state = 99;
        }
      }

      if (position.x< 475 && position.x>325 && position.y<375 && position.y>325 && time<150) {
        fill(255, 0, 0);
        text("Demetrius, Stavros, and Oedipus", 325, 350);
        time ++;
        if (time>=150) {
          state = 99;
        }
      }
    }
  }

  if (state == 99) {
    background(0);
    fill(255);
    text("INCORRECT", 240, 50 );
    text("Hover below to play again", 160, 300);
    text("HERE", 260, 400);
    stateRun();
    for (Finger f : leap.getFingerList ()) {
      PVector position = leap.getTip(f);
      PVector position2 = leap.getOrigin(f);
      PVector velocity = leap.getVelocity(f);
      float lengthF = leap.getLength(f);
      float widthF = leap.getWidth(f);
      PVector direc = leap.getDirection(f);
      fill(255, 0, 0);
      ellipse(position.x, position.y, 10, 10);
      fill(0, 0, 255);
      ellipse(position2.x, position2.y, 10, 10);
      fill(255);
      line(position.x, position.y, position2.x, position2.y);

      if (position.x< 300 && position.x>260 && position.y<425 && position.y>375 && counter<150) {
        fill(255, 0, 0);
        text("HERE ", 260, 400);
        counter ++;
        if (counter>=150) {
          state = 2;
        }
      }
    }
  }

  if (state == 100) {
    background(0);
    fill(255);
    text("GOOD JOB", 250, 50); 
    text("Hover below to play again", 160, 300);
    text("HERE", 260, 400);
    stateRun();
    for (Finger f : leap.getFingerList ()) {
      PVector position = leap.getTip(f);
      PVector position2 = leap.getOrigin(f);
      PVector velocity = leap.getVelocity(f);
      float lengthF = leap.getLength(f);
      float widthF = leap.getWidth(f);
      PVector direc = leap.getDirection(f);
      fill(255, 0, 0);
      ellipse(position.x, position.y, 10, 10);
      fill(0, 0, 255);
      ellipse(position2.x, position2.y, 10, 10);
      fill(255);
      line(position.x, position.y, position2.x, position2.y);

      if (position.x< 300 && position.x>260 && position.y<425 && position.y>375 && counter1<150) {
        fill(255, 0, 0);
        text("HERE ", 260, 400);
        counter1 ++;
        if (counter1>=150) {
          state = 2;
        }
      }
    }
  }


  if (state == 51) {
    frameRate(1000);
    textSize(30);
    fill(255);
    text("ART", 280, 50);
    for (Finger f : leap.getFingerList ()) {
      PVector position = leap.getTip(f);
      fill(255, 255, 255);
      ellipse(position.x, position.y, 2, 2);
    }
    if (random == 1) {
      background(0);
    }
    random++;
  }
  if (state == 50) {
    background(0, 0, 0);
    textSize(30);
    fill(255);
    text("SCIENCE", 220, 50);
    stateRun();
  }
}
public void keyPressed() {
  if (key == 's') {
    if (leap.isEnabled(Type.TYPE_SWIPE)) {
      leap.disableGesture(Type.TYPE_SWIPE);
      lastGesture = "Swipe Gesture disabled.";
    } else {
      leap.enableGesture(Type.TYPE_SWIPE);
      lastGesture = "Swipe Gesture enabled.";
    }
  }
}
public void swipeGestureRecognized(SwipeGesture gesture) {
  if (gesture.state() == State.STATE_STOP) {
    System.out.println("//////////////////////////////////////");
    System.out.println("Gesture type: " + gesture.type());
    System.out.println("ID: " + gesture.id());
    System.out.println("Position: " + leap.vectorToPVector(gesture.position()));
    System.out.println("Direction: " + gesture.direction());
    System.out.println("Duration: " + gesture.durationSeconds() + "s");
    System.out.println("Speed: " + gesture.speed());
    System.out.println("//////////////////////////////////////");
    lastGesture = "Gesture type: " + gesture.type().toString() + "\n";
    lastGesture += "ID: " + gesture.id() + "\n";
    lastGesture += "Position: " + leap.vectorToPVector(gesture.position()) + "\n";
    lastGesture += "Direction: " + gesture.direction() + "\n";
    lastGesture += "Speed: " + gesture.speed() + "\n";
    lastGesture += "Duration: " + gesture.durationSeconds() + "s" + "\n";
    if (gesture.speed()>230) {
      state = 1;
      time = 0;
      random = 0;
      shrinkic = 225;
    }
  } else if (gesture.state() == State.STATE_START) {
  } else if (gesture.state() == State.STATE_UPDATE) {
  }
}
void stateRun() {
  for (Finger f : leap.getFingerList ()) {
    PVector position = leap.getTip(f);
    PVector position2 = leap.getOrigin(f);
    PVector velocity = leap.getVelocity(f);
    float lengthF = leap.getLength(f);
    float widthF = leap.getWidth(f);
    PVector direc = leap.getDirection(f);
    fill(255, 0, 0);
    ellipse(position.x, position.y, 10, 10);
    fill(0, 0, 255);
    ellipse(position2.x, position2.y, 10, 10);
    fill(255);
    line(position.x, position.y, position2.x, position2.y);
  }
  for (Hand hand : leap.getHandList ()) {
    PVector handPosition = leap.getPosition(hand);
    PVector handCenter = leap.getSphereCenter(hand);
    float handSize = leap.getSphereRadius(hand);
    fill(0, 255, 0);
    ellipse(handPosition.x, handPosition.y, 50, 50);
  }
}

