class ParticleSystem{
 
  //ArrayList<Mover[]> list;
  
  ArrayList<Mover> list;
  
  
  
  ParticleSystem()
  {
    this.list=new ArrayList<Mover>();
  }
  
  
  void addParticle(PVector pt)
  {
    float maxSpeed=random(4,7);
    float maxForce=random(0.1,0.3);
    Mover m=new Mover(pt,maxSpeed,maxForce);
    list.add(m);
  }
  
  
  void run()
  {
    for(Mover m:list)
    {
      m.update(); 
      //m.edges();
      m.display();
    }
    
  }
  
}
