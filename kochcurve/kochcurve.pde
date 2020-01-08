public class Point{
  public float x;
  public float y;

  public Point(int x, int y){
    this.x = x;
    this.y = y;
  }

  public float dst(Point p){
    return sqrt((x-p.x)*(x-p.x) + (y-p.y)*(y-p.y));
  }
}

void koch(int n, Point p1, Point p2){
  if(n < 1){
    line((int)p1.x, (int)p1.y, (int)p2.x, (int)p2.y);
  }
  else{
    Point np1 = new Point(0, 0);
    Point np2 = new Point(0, 0);
    Point v = new Point(0, 0);
    float angle, high;

    np1.x = (2*p1.x + p2.x) / 3.0;
    np1.y = (2*p1.y + p2.y) / 3.0;
    np2.x = (p1.x + 2*p2.x) / 3.0;
    np2.y = (p1.y + 2*p2.y) / 3.0;

    angle = atan2(p2.y - p1.y, p2.x - p1.x);
    high = p1.dst(np1) * sqrt(3) / 2; //sin(PI / 3.0);

    v.x = (np1.x + np2.x) / 2.0 + high * sin(angle);
    v.y = (np1.y + np2.y) / 2.0 - high * cos(angle);

    koch(n-1, p1, np1);
    koch(n-1, np1, v);
    koch(n-1, v, np2);
    koch(n-1, np2, p2);
  }
}

void setup(){
  size(640, 480);
}

void draw(){

  int n = 4;
  Point s = new Point(0, height / 2);
  Point e = new Point(width, height / 2);
  
  background(0);
  stroke(255, 0, 0);
  koch(n, s, e);
  text("n=" + n, 10, 10);

}
