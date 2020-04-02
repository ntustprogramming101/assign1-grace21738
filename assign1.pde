final int ROG_X = 280;
final int SOLDIER_RANGE =0;
final int SOLDIER_Y = 160;
final int ROBOT_Y = 160;


PImage  bg,groundhog,life,robot,soil,soldier;

int randRobot,randSoldier;
float hogX , hogY , hogSpeed;
float soldierX=0.0, soldierY , soldierSpeed;
float robotX , robotY , robotSpeed;
float laserEndX, laserSpeed , laserLength;
float laserStartY,laserStartX , laserRestart,laserRestartX;



void setup() {
	size(640, 480, P2D);
	bg = loadImage("img/bg.jpg");
  groundhog = loadImage("img/groundhog.png");
  life = loadImage("img/life.png");
  robot = loadImage("img/robot.png");
  soil = loadImage("img/soil.png");
  soldier = loadImage("img/soldier.png");
  
  //soldier
  randSoldier = floor(random(0,4));
  soldierY = SOLDIER_Y + randSoldier*80;
  soldierSpeed = floor(random( 1,3 )) ;
  
  //robot -> avoid to same with soldier
  do{
    randRobot = floor(random(0,4));
  }while( randSoldier==randRobot );
  robotX = floor(random( 120,540 ));
  robotY = ROBOT_Y + randRobot*80;
  
  //laser
  laserSpeed = floor(random(1,5));
  laserStartY = robotY + 37;
  laserStartX = robotX+25 ;
  laserEndX = laserStartX-1;
  laserLength = 35;
  
  laserRestartX = laserStartX;
  
}

void draw() {
	//bg&life picture
  image( bg,0,0,width,height );
  image( life,10,10 );
  image( life,80,10 );
  image( life,150,10 );
  
  //grass
  fill( 124,204,25 );
  noStroke();
  rect( 0,145,640,335 );
  image( soil,0,160 );
  //sun
  fill( 255,255,0 );
  ellipse( 590,50,130,130 );
  fill( 253,184,19 );
  ellipse( 590,50,120,120 );
  
  //groundhog
  image( groundhog,ROG_X,80 );
  
  //soldier
  image( soldier, soldierX ,soldierY );
  soldierX += soldierSpeed;
  
  if( soldierX>640 ){
    soldierX = -100;
  }
  
  //robot
  image( robot,robotX,robotY );
  
  //laser
    strokeWeight(10);
    stroke(255,0,0);
    line(laserStartX, laserStartY, laserEndX, laserStartY);
    laserEndX -=2;
    
    //action of laser
    if(laserStartX-laserEndX == laserLength){
      laserStartX -= 2;
    }
    
    //two blocks then return
    if (laserEndX <= robotX-125){
      laserEndX = laserRestartX-1;
      laserStartX = laserRestartX;
    }
     
}
