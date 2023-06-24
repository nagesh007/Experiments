/**
 
 Copyright (c) 2023, NAGESH M H
 All rights reserved.
 
 This source code is licensed under the Apache-2.0 license found in the
 LICENSE file in the root directory of this source tree.
 
 Collatz Conjecture Visualization
 
 @author Nagesh M H
 
 */


int maxNum=100;
float angle=0.2;
int len=15;
int threshold=150;
int extraHeight;

IntList series;
int startX, startY;
ParticleSystem ps;
PFont font;
int fontSize=34;

boolean start=true;


void setup()
{
  size(1920, 1080, P2D);
  background(0);


  extraHeight=height+50;

  startX=width/2;
  startY=height/2;

  ps=new ParticleSystem();
  series=new IntList();

  // generate
  for (int c=1; c<=maxNum; c++)
  {
    int n=c;
    series.append(n);
    while (n>1)
    {
      n=collatz(n);
      series.append(n);
    }
    series.reverse();
    cal();
  }



  // create Font
  font=createFont("JosefinSansRegular.ttf", fontSize);
  textFont(font);
}


void draw()
{
  background(0);

  if (start)
  {
    dispText();
    ps.run();
  }
}


void keyPressed()
{
  if (key==' ')
  {
    start=true;
  }
  if (key=='s')
  {
    saveFrame("screen.png");
  }
}

int collatz(int n)
{
  if (n%2==0)
  {
    // even number
    return n/2;
  } else
  {
    // odd number
    return (3*n)+1;
  }
}

void cal()
{

  //int r=0; // radius
  float rotation=0; //  theta
  PVector firstPoint=new PVector(startX, startY);
  int c=#ffffff;
  ps.addParticle(firstPoint, c);

  for (int i=1; i<series.size(); i++)
  {

    int value=series.get(i);
    if (value%2==0)
    {
      // even
      rotation+=angle;
      //c=#77aaff;
    } else
    {
      // odd
      rotation+=-angle;
      //c=#FEE140;
    }

    // convert polar co-ordinates to cartesian
    float y=len*sin(rotation);
    float x=len*cos(rotation);
    PVector newPoint=new PVector(x, y);
    PVector temp=PVector.add(firstPoint, newPoint);
    firstPoint=temp;
    ps.addParticle(temp, c);
  }
  angle+=0.001;
  series.clear();
}


void dispText()
{
  fill(#F76B1C);
  textSize(fontSize);
  text("Collatz  Conjecture  Visualization", 50, 80);
  fill(255);
  textSize(28);
  text("Max Number  : "+maxNum, 50, 150);
  text("Number of Particles  : "+ps.getSize(), 50, 200);
  text("Frame Rate  : "+int(frameRate), 50, 250);
}


void dispSeries()
{
  for (int i=0; i<series.size(); i++)
  {
    print(series.get(i)+" ");
  }
  println();
}
