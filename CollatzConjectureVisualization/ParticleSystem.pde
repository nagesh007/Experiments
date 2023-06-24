/**
 
 
 Copyright (c) 2023, NAGESH M H
 All rights reserved.
 
 This source code is licensed under the Apache-2.0 license found in the
 LICENSE file in the root directory of this source tree.
 
 
 Collatz Conjecture Visualization
 
 @author Nagesh M H
 
 */

class ParticleSystem {

  ArrayList<Mover> list;

  ParticleSystem()
  {
    this.list=new ArrayList<Mover>();
  }


  void addParticle(PVector pt, int c)
  {
    float maxSpeed=random(5, 8);
    float maxForce=random(0.1, 0.3);
    Mover m=new Mover(pt, maxSpeed, maxForce,c);
    list.add(m);
  }

  int getSize()
  {
    return list.size();
  }


  void run()
  {
    PVector wind=new PVector(0.09 ,0.01);
    for (Mover m : list)
    {
      m.arrive();
      m.applyForce(wind);
      m.update();
      m.display();
    }
  }
}
