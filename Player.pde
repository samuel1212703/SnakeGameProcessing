class Player{
  int retning; int x; int y; int points = 0;
  ArrayList<Integer> xPosList = new ArrayList();
  ArrayList<Integer> yPosList = new ArrayList();
  
  Player() {
    retning = -1; //1 = up, 2 = højre, -1 = ned, -2 = venstre
    x = 1; y = 1;
  }
  
  void run(int scale, int scale2) {
    if(points == pow(scale2, 2));
    if(x == point1.x && y == point1.y) {points++; createPoint();} //Add point if colliding
    addPoint();
    if(retning == 1) {y--;} else if(retning == 2){x++;} else if(retning == -1){y++;} else if(retning == -2){x--;} //Move snake in "retning"
    noStroke(); fill(0);
    square(scale * x, scale * y, scale); //Draw player
    for(int i = 0; i < points; i++) {square(scale * xPosList.get(i), scale * yPosList.get(i), scale);} //Create tail squares
    
    for(int i = 1; i < xPosList.size(); i++) {if(x == xPosList.get(i) && y == yPosList.get(i)) {dead();}} // Self collision
    
    if(x < 0 || x > scale2 || y < 0 || y > scale2) dead(); //Wall collision
    points2 = points;
    allowClick = true;
  }
  
  void addPoint(){
    xPosList.add(x); yPosList.add(y);
    if(xPosList.size() > points){
      xPosList.remove(0); yPosList.remove(0);
    }
  }
  public void variableReset(){
    points = 0; retning = -1; x = 1; y = 1; xPosList.clear(); yPosList.clear();
  }
}
