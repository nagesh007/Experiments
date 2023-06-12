/**
 
 
 Copyright (c) 2023, NAGESH M H
 All rights reserved.
 
 This source code is licensed under the Apache-2.0 license found in the
 LICENSE file in the root directory of this source tree.
 
 
 Collatz Conjecture Visualization
 
 @author Nagesh M H
 
 */

class Mover {

  float mass, maxSpeed, maxForce;
  PVector pos, acceleration, velocity, target;
  float base=10;
  float len=base*1.5;
  float halfBase=base/2;

  Mover(PVector loc, float maxSpeed, float maxForce)
  {
    //this.pos=new PVector(random(width), random(height));
    this.pos=loc.copy();
    this.target=loc.copy();
    this.acceleration=new PVector(0, 0);
    this.velocity=new PVector(0, 0);
    
    this.maxSpeed=maxSpeed;
    this.maxForce=maxForce;
    this.mass=1;
  }


  void update()
  {

    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    pos.add(velocity);

    acceleration.mult(0);
  }

  void edges()
  {
    if (pos.x>width)
    {
      pos.x=0;
    }
    if (pos.x<0)
    {
      pos.x=width;
    }

    if (pos.y>height)
    {
      pos.y=0;
    }
    if (pos.y<0)
    {
      pos.y=height;
    }
  }

  void applyForce(PVector f)
  {
    PVector force=PVector.div(f, mass);
    acceleration.add(force);
  }


  void display()
  {
    fill(255, 50);
    stroke(255);
    
    ellipse(pos.x,pos.y,4,4);
    //float angle=velocity.heading();
    //pushMatrix();
    //rotate(angle);
    //beginShape();
    //vertex(pos.x, pos.y);
    //vertex(pos.x-len, pos.y-halfBase);
    //vertex(pos.x-len, pos.y+halfBase);
    //endShape();
    //popMatrix();
  }
}
