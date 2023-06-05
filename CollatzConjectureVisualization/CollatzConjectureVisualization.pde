/**
 
 
 Copyright (c) 2023, NAGESH M H
 All rights reserved.
 
 This source code is licensed under the Apache-2.0 license found in the
 LICENSE file in the root directory of this source tree. 
 
 
 Collatz Conjecture Visualization
 
 @author Nagesh M H 
 
 */
 
 
int target=100;
int startX, startY;
float angle=0.1;
int len=10;
ArrayList<PVector> list;
int diameter=8;

IntList series;
void setup()
{
  size(1920, 1080, P2D);
  background(0);

  startX=width/2;
  startY=height-diameter;
  
  list=new ArrayList<PVector>();
  series=new IntList();
  for (int c=1; c<=target; c++)
  {
    int n=c;
    series.append(n);
    while (n>1)
    {
      n=collatz(n);
      series.append(n);
    }
    series.reverse();
    //dispSeries();
    cal();
  }
}


void draw()
{
  background(0);
  translate(startX,startY);
  rotate(-PI/2);
  stroke(255);
  fill(255,50);
  float oldX=0;
  float oldY=0;
  for (PVector pt : list)
  { 
    line(oldX,oldY,pt.x,pt.y);
    oldX=pt.x;
    oldY=pt.y;
    //ellipse(pt.x, pt.y, diameter, diameter);
  }
  
  noLoop();
}


int collatz(int n)
{
  if (n%2==0)
  {
    // even
    return n/2;
  } else
  {
    // odd
    return (3*n)+1;
  }
}

void cal()
{

  int r=0; // radius
  float rotation=0; //  theta
  PVector firstPt=new PVector(0, 0);
  list.add(firstPt);
  for (int i=1; i<series.size(); i++)
  {
    int value=series.get(i);
    r+=len;
    if (value%2==0)
    {
      // even
      rotation+=angle;
    } else
    {
      // odd
      rotation+=-angle;
    }
    
    // convert polar co-ordinates to cartesian
    float y=r*sin(rotation);
    float x=r*cos(rotation);
    PVector newPoint=new PVector(x, y);
    list.add(newPoint);
  }
  //angle+=0.01;
  series.clear();
}


void dispSeries()
{
  for (int i=0; i<series.size(); i++)
  {
    print(series.get(i)+" ");
  }
  println();
}
