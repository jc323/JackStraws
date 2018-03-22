import java.util.Random;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Map;
import java.util.TreeMap;

int winSize = 512;
int numSticks = 7;
int stickLen = 150;
Random myRand = new Random();
ArrayList<Sticks> stks = new ArrayList<Sticks>();
ArrayList<Sticks> connStks = new ArrayList<Sticks>();



void setup() {
  Point somePt = new Point(250, 250);
  Point someothPt = new Point(150, 150);
  int i;
  for (i = 0; i < numSticks; i++) {
    Point beg = new Point(winSize*myRand.nextFloat(), 
    winSize*myRand.nextFloat());
    Point end = new Point(winSize*myRand.nextFloat(), 
    winSize*myRand.nextFloat());

    //Sticks myStk = new Sticks(beg, end, beg.dist(end));
    stks.add(new Sticks(beg, end, beg.dist(end)));
  }
  


  size(winSize, winSize);
}
void draw() {
  background(0, 0, 0);
  stroke(0, 255, 0);
  strokeWeight(2);
  for (int i = 0; i < numSticks; i++) {
    line(stks.get(i).pt0.x, stks.get(i).pt0.y, stks.get(i).pt1.x, stks.get(i).pt1.y);
  }  
  
  for (Sticks st: connStks) {
    stroke(255,0,0);
    line(st.pt0.x, st.pt0.y, st.pt1.x, st.pt1.y);

  }
     
}

static Map<Integer, Sticks> memo = new TreeMap<Integer, Sticks>();


Sticks connectedStraws(Sticks clickedSTK){
  stroke(255,0,0);
  line(clickedSTK.pt0.x, clickedSTK.pt0.y, clickedSTK.pt1.x, clickedSTK.pt1.y);

  for(Sticks s: stks){  
    int intersection = s.intersect(clickedSTK); 
      if(intersection == 2){
        connStks.add(s);
        memo.put(stks.indexOf(s), s);
      }
    }
  
  for (int i = 0; i < connStks.size(); i++) {
    stroke(255,0,0);
    line(connStks.get(i).pt0.x, connStks.get(i).pt0.y, connStks.get(i).pt1.x, connStks.get(i).pt1.y);

  }
    connStks.clear();
    return null;

}


void mousePressed() {
  float mx = mouseX;
  float my = mouseY;
  Point click = new Point(mx, my);
  Sticks clickedSTK = new Sticks();
  
  
  for(int i = 0; i < numSticks; i++){
     if((stks.get(i).pointToLineDist(stks.get(i).pt0, stks.get(i).pt1, click)) < 5)
       clickedSTK = stks.get(i);   
  }
  if(clickedSTK.pt0 != null){
    connectedStraws(clickedSTK);
  }
  else
    System.out.println("you did not click a stick try again. Imbecile");
    

}

void keyPressed() {
  // if space is clicked throw same amount of sticks
  if (key == ' ') {
    stks.clear();
    connStks.clear();
    memo.clear();
    for (int i = 0; i < numSticks; i++) {
      Point beg = new Point(winSize*myRand.nextFloat(), 
      winSize*myRand.nextFloat());
      Point end = new Point(winSize*myRand.nextFloat(), 
      winSize*myRand.nextFloat());
      
      stks.add(new Sticks(beg, end, beg.dist(end)));
    }
  }
}

