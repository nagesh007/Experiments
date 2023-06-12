/**
 
 
 Copyright (c) 2023, NAGESH M H
 All rights reserved.
 
 This source code is licensed under the Apache-2.0 license found in the
 LICENSE file in the root directory of this source tree.
 
 
 Collatz Conjecture Visualization
 
 @author Nagesh M H
 
 */


int target=400;
float angle=0.2;
int len=20;
int gap=50;

IntList series;
int startX, startY;
ParticleSystem ps;

void setup()
{
  size(1920, 1080, P2D);
  background(0);

  startX=width/2;
  //startY=height-gap;
  startY=height/3;

  ps=new ParticleSystem();
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
  ps.run();
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

  //int r=0; // radius
  float rotation=0; //  theta
  PVector firstPt=new PVector(startX, startY);
  ps.addParticle(firstPt);
  //stroke(255);
  //resetMatrix();
  //translate(startX, startY);
  for (int i=1; i<series.size(); i++)
  {
    int value=series.get(i);
    //r+=len;
   
    if (value%2==0)
    {
      // even
      rotation+=angle;
      //rotate(angle);
    } else
    {
      // odd
      rotation+=-angle;
      //rotate(-angle);
    }
    
    //line(0, 0, 0, -len);
    //fill(255,0,180);
    //ellipse(0,-len,2,2);
    //translate(0,-len);
    // convert polar co-ordinates to cartesian
    float y=len*sin(rotation);
    float x=len*cos(rotation);
    PVector newPoint=new PVector(x, y);
    PVector temp=PVector.add(firstPt, newPoint);
    firstPt=temp;
    //println("After : "+firstPt);
    //println(temp);
    //fill(255,0,255);
    //ellipse(temp.x,temp.y,30,30);
    ps.addParticle(temp);
  }
  //angle+=0.0001;
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
