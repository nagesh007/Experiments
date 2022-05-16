
/**
 
 
 Copyright (c) 2022, NAGESH M H
 All rights reserved.
 
 This source code is licensed under the Apache-2.0 license found in the
 LICENSE file in the root directory of this source tree. 
 
 
 Ex: Flower pattern can be used for loading screen animation
 
 @author Nagesh M H 
 
 */


Flower leftFlower;
Flower rightFlower;

float leftCenterX, leftCenterY;
float rightCenterX, rightCenterY;

float centerX;

void setup()
{
  size(1920, 1080);
  background(0);

  leftFlower=new Flower(50, 200, 2);
  rightFlower=new Flower(50, 200, 5);

  leftCenterX=width/4;
  leftCenterY=height/2;

  centerX=width/2;

  rightCenterX=centerX;
  rightCenterY=0;

  stroke(255);
  line(centerX, 0, centerX, height);
  noStroke();
  
  textSize(22);
  textAlign(CENTER, CENTER);
  text("Alpha", leftCenterX, 100);
  text("Gamma", centerX+leftCenterX, 100);
  
}

void draw()
{

  noStroke();

  translate(leftCenterX, leftCenterY);
  leftFlower.ripple();
  leftFlower.edges();
  leftFlower.display();



  translate(rightCenterX, rightCenterY);
  rightFlower.ripple();
  rightFlower.edges();
  rightFlower.display();
}
