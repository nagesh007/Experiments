class Ball {

  PVector pos, velocity, acceleration;

  float mass, radius, diameter;

  color c;

  Ball(PVector loc, float mass, color c)
  {
    pos=loc.copy();
    velocity=new PVector(0, 0);
    acceleration=new PVector(0, 0);
    this.mass=mass;
    this.diameter=map(mass, 10, 150, 20, 200);
    this.radius=diameter/2;
    this.c=c;
  }
  
  void update()
  {
    velocity.add(acceleration);
    pos.add(velocity);
    
    int rx=(int)(pos.x+radius);
    int lx=(int)(pos.x-radius);
    
    int ty=(int)(pos.y-radius);
    int by=(int)(pos.y+radius);
    if(by>=height)
    {
      pos.y=height-radius;
      velocity.y*=-1;
      
      //apply friction
      applyFriction();
      
    }
    
    if(rx>=width)
    {
      pos.x=width-radius;
      velocity.x*=-1;
    }
    
    if(lx<=0)
    {
      pos.x=radius;
      velocity.x*=-1;
    }
    
    acceleration.mult(0);
  }
  
  void applyForce(PVector f)
  {
    PVector force=PVector.div(f,mass);
    acceleration.add(force);
  }
  
  
  void applyFriction()
  {
    
  }

  void display()
  {
    fill(c);
    ellipse(pos.x,pos.y,diameter,diameter);
    
  }
}
