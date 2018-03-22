class Point {
    float x, y;
    public Point(float x, float y) {
        this.x = x;
        this.y = y;
    }
    public Point() {
        x = y = 0.0f;
    }
    
    public float dist(Point p) {
        return sqrt((x - p.x)*(x - p.x) + (y - p.y)*(y - p.y));
    }
    
    
    
    public boolean equals(Point p) {
        return (x == p.x) && (y == p.y);
    }
    
    public String toString() {
        return "(" + x + ", " + y + ")";
    }
}
