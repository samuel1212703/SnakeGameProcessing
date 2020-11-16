class Point{
  int x = 0;
  int y = 0;
  int scale1 = 0;
  
  Point(){
    
  }
  
  void createPoint(int scale2, int scale, ArrayList xPL, ArrayList yPL){
    scale1 = scale2;
    boolean temp = false;
    while (temp == false) {
      x = int(random(scale)); y = int(random(scale));
      if(!xPL.contains(x) && !yPL.contains(y)){
        temp = true;
      }
    }
  }
  
  void update(int points1){
    textSize(40); text("Points: " + points1, 20, 40);
    fill(255,0,0); 
    square(scale1 * x, scale1 * y, scale1);
  }
}
