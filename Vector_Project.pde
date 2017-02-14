PVector location1, location2, velocity1, velocity2, acceleration, force1, force2;
PImage sprite1, sprite2;
void setup()
{
 fullScreen(P3D);
 location1 = new PVector(width/2, 20);
 location2 = new PVector(width/2, height -20);
 velocity1 = new PVector(0, 0);
 velocity2 = new PVector(0, 0);
 acceleration = new PVector (random(-0.001,0.01), random(-1, 1)); 
 force1 = new PVector(0, 0);
 force2 = new PVector(0, 0);
 
 sprite1 = loadImage("Sprite1.png");
 sprite2 = loadImage("Sprite2.png");
}

void draw()
{
  background(227, 172, 18);
  
  check();
  update();
  handleMovement();
  
  velocity1.add(acceleration);
  velocity2.add(acceleration);
  location1.add(velocity1);
  location1.add(force1);
  location2.sub(velocity2);
  location2.add(force2);
  acceleration = PVector.random2D();
  
  imageMode(CENTER);
  fill (75);
  image (sprite1, location1.x, location1.y);
  image (sprite2, location2.x, location2.y, 20, 20);
 
  camera(width/2, height/2, (height/2.0) / tan(PI*30.0 / 180.0), 
  width/2, height/2, 0, 
  0, 1, 0);
}

void update()
{
 PVector dir1 = PVector.sub(location1, location2);
 dir1.normalize();
 dir1.mult(0.05);
 dir1.mult(-1);
 acceleration = (dir1);
}

void handleMovement()
{
  if (key == 'w')
  {
    force1.x = 0;
    force1.y = -3;
  }
  else if (key == 'a')
  {
    force1.x = -3;
    force1.y = 0;
  }
  else if (key == 's')
  {
    force1.x = 0;
    force1.y = 3;
  }
  else if (key == 'd')
  {
    force1.x = 3;
    force1.y = 0;
  }
  
  if (key == 'i')
  {
    force2.x = 0;
    force2.y = -5;
  }
  else if (key == 'j')
  {
    force2.x = -5;
    force2.y = 0;
  }
  else if (key == 'k')
  {
    force2.x = 0;
    force2.y = +5;
  }
  else if (key == 'l')
  {
    force2.x = 5;
    force2.y = 0;
  }
} 

void check()
{
  if (dist(location1.x, location1.y, location2.x, location2.y) <= 30)
  {
    velocity1.mult(-1);
    velocity2.mult(-1);
  }
  
  if (location1.x >= width -15 || location1.x <= 15)
  {
    if(location1.x >= width -15)
    {
      location1.x = width -15;
    }
    else if(location1.x <= 15)
    {
      location1.x = 15;
    }
    velocity1.x = velocity1.x * -1;
  }
  
  if (location1.y <= 15 || location1.y >= height -15)
  {
    if(location1.y >= height -15)
    {
      location1.y = height -15;
    }
    else if(location1.y <= 15)
    {
      location1.y = 15;
    }
    velocity1.y = velocity1.y * -1;
  }
  
  
  if (location2.x >= width -10 || location2.x <= 10)
  {
    if(location2.x >= width -10)
    {
      location2.x = width -10;
    }
    else if(location2.x <= 10)
    {
      location2.x = 10;
    }
    velocity2.x = velocity2.x * -1;
  }
    
  if (location2.y <= 10 || location2.y >= height -10)
  {
    if(location2.y >= height -10)
    {
      location2.y = height -10;
    }
    else if(location2.y <= 10)
    {
      location2.y = 10;
    }
    velocity2.y = velocity2.y * -1;
  }
}