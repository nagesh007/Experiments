/**
 
 
 Copyright (c) 2022, NAGESH M H
 All rights reserved.
 
 This source code is licensed under the Apache-2.0 license found in the
 LICENSE file in the root directory of this source tree. 
 
 
 Ex: Flower pattern can be used for loading screen animation
 
 @author Nagesh M H 
 
 */

class Flower
{
  private float radius;
  private float theta;
  private float lowerLimit, upperLimit;
  private final float ballSize=7;


  private float x, y=0;
  private float change;
  private color flowerColor=255;

  /**
   chnageFactor range should be 1 to 5 
   
   */
  Flower(float radius, float upperLimit, float changeFactor)
  {
    this.radius=radius;  
    this.lowerLimit=radius;
    this.upperLimit=upperLimit;
    this.change=constrain(changeFactor, 1, 5);
  }


  void ripple()
  {

    y= radius * sin(theta);
    x= radius * cos(theta);

    theta+=change;
    radius+=change;
  }

  void edges()
  {
    if (radius >=upperLimit)
    {
      radius=upperLimit;
      change=change*-1;
      flowerColor=0;
    }

    if (radius <=lowerLimit)
    {
      radius=lowerLimit;
      change=change*-1;
      flowerColor=255;
    }
  }

  void display()
  {
    fill(flowerColor);
    ellipse(x, y, ballSize, ballSize);
  }
}
