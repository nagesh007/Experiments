

/**
   Objects falling in different planets
*/


Ball b;

void setup()
{
  size(1920,1080);
  background(0);
  
  PVector loc=new PVector(width/2,-10);
  b=new Ball(loc,70,color(5, 196, 107));
  
}


void draw()
{
  background(0);
  
  PVector gravity=new PVector(0,0.1);
  gravity.mult(b.mass);
  b.applyForce(gravity);
  
  b.update();
  
  b.display();
 
}
