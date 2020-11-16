PImage p; //Background picture (picture generated in createBackground();)
int bgScale = 30, scale2 = 21; //Scale
color col = color(25, 150, 25); //Background color
Player player; Point point1; //Classes
int points2 = 0, pointX, pointY; //Points
boolean allowClick = true;

void setup(){
  size(660,660); //Skal gå op i 30 (lige nu: 30 * 21)
  frameRate(bgScale*0.33);
  player = new Player();
  point1 = new Point(); 
  p = createBackground(); 
  createPoint();
}

void draw(){
  image(p, 0, 0); //Draw background
  point1.update(points2);
  player.run(bgScale, scale2);
}

void createPoint(){
  point1.createPoint(bgScale, scale2, player.xPosList, player.yPosList);
}

void won() {println("won");} 
void dead() {
  println(random(1000));
  println("dead");
  player.variableReset();
}

void keyPressed() {
  if (allowClick) {
    if ((key == 'w' || keyCode == UP) && player.retning != -1) {player.retning = 1; allowClick = false;}
    if ((key == 's' || keyCode == DOWN) && player.retning != 1) {player.retning = -1; allowClick = false;}
    if ((key == 'd' || keyCode == RIGHT) && player.retning != -2) {player.retning = 2; allowClick = false;}
    if ((key == 'a' || keyCode == LEFT) && player.retning != 2) {player.retning = -2; allowClick = false;}
  }
}
  /*if (allowClick) {retning(keyCode, player.retning);}
}

void retning(int key1, int ret){
  if ((key == key1 || keyCode == key1) && abs(player.retning) != ret) {
    player.retning = ret;
    allowClick = false;
  }
}*/

PImage createBackground(){
  background(col/2); noStroke(); fill(col); //Indstillinger
  //For loops til at lave felterne
  for(int i = 0; i < width/bgScale; i++){
    for(int j = 0; j < height/bgScale; j++){
      if((i+j)%2 == 0){
        rect(bgScale*i,bgScale*j,bgScale,bgScale);}}}
  p=get(); return p; //Get the created picture and send it back as (p)
}

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
    rect(scale * x, scale * y, scale, scale); //Draw player
    for(int i = 0; i < points; i++) {rect(scale * xPosList.get(i), scale * yPosList.get(i), scale, scale);} //Create tail squares
    
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
    rect(scale1 * x, scale1 * y, scale1, scale1);
  }
}
