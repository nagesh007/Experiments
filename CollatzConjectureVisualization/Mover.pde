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


  Mover(PVector loc, float maxSpeed, float maxForce)
  {
    this.pos=new PVector(random(width), random(height, extraHeight));
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

  void applyForce(PVector f)
  {
    // as now mass is 1 so following line will be commented
    //PVector force=PVector.div(f, mass);
    acceleration.add(f);
  }

  void arrive()
  {

    PVector desired=PVector.sub(target, pos);
    float d=desired.mag();
    float speed=maxSpeed;
    if (d<threshold)
    {
      speed=map(d, 0, threshold, 0, maxSpeed);
    }
    desired.setMag(speed);
    PVector steering=PVector.sub(desired, velocity);
    steering.limit(maxForce);

    applyForce(steering);
  }

  void display()
  {
    fill(255, 50);
    stroke(255);
    ellipse(pos.x, pos.y, 4, 4);
  }
}
