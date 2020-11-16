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
