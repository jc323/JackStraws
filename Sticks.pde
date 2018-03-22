class Sticks {
  Point pt0, pt1;
  float d;
  int DONT_INTERSECT = 0;
  int COLLINEAR = 1;
  int DO_INTERSECT = 2;

  public Sticks() {
    this.pt0 = null;
    this.pt1 = null;
    this.d = 0;
  }

  public Sticks(Point p0, Point p1, float dist) {
    this.pt0 = p0;
    this.pt1 = p1;
    this.d = dist;
  }

  public double pointToLineDist(Point A, Point B, Point P) {
    double normalLength = Math.sqrt((B.x-A.x)*(B.x-A.x)+(B.y-A.y)*(B.y-A.y));
    return Math.abs((P.x-A.x)*(B.y-A.y)-(P.y-A.y)*(B.x-A.x))/normalLength;
  }

  int intersect(Sticks s1) {
    float x1 = s1.pt0.x;
    float y1 = s1.pt0.y;
    float x2 = s1.pt1.x;
    float y2 = s1.pt1.y;

    float x3 = pt0.x;
    float y3 = pt0.y;
    float x4 = pt1.x;
    float y4 = pt1.y;

    float a1, a2, b1, b2, c1, c2;
    float r1, r2, r3, r4;

    // Compute a1, b1, c1, where line joining points 1 and 2
    // is "a1 x + b1 y + c1 = 0".
    a1 = y2 - y1;
    b1 = x1 - x2;
    c1 = (x2 * y1) - (x1 * y2);

    // Compute r3 and r4.
    r3 = ((a1 * x3) + (b1 * y3) + c1);
    r4 = ((a1 * x4) + (b1 * y4) + c1);

    // Check signs of r3 and r4. If both point 3 and point 4 lie on
    // same side of line 1, the line segments do not intersect.
    if ((r3 != 0) && (r4 != 0) && same_sign(r3, r4)) {
      return DONT_INTERSECT;
    }

    // Compute a2, b2, c2
    a2 = y4 - y3;
    b2 = x3 - x4;
    c2 = (x4 * y3) - (x3 * y4);

    // Compute r1 and r2
    r1 = (a2 * x1) + (b2 * y1) + c2;
    r2 = (a2 * x2) + (b2 * y2) + c2;

    // Check signs of r1 and r2. If both point 1 and point 2 lie
    // on same side of second line segment, the line segments do
    // not intersect.
    if ((r1 != 0) && (r2 != 0) && (same_sign(r1, r2))) {
      return DONT_INTERSECT;
    }

    return DO_INTERSECT;
  }

  boolean same_sign(float a, float b) {

    return (( a * b) >= 0);
  }
}



