class Agent{
  Strategy strategy;
  int stratVal = 0;
  
  Brain brain;
  
  PVector pos = new PVector(0, 0);
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  PVector fill = new PVector(0, 0, 0);
  
  Agent(float x, float y, PVector[] colors){
    
    brain = new Brain(width + height);
    
    pos.set(x, y);
    int val = (int)random(0, 9);
    stratVal = val;
    updateStrat(val);
    
  }
  
  void updateStrat(int val){
    this.stratVal = val;
    switch(val){
      case 0:
        strategy = new Cooperator();
        fill = colors[0];
        break;
      case 1:
        strategy = new Defector();
        fill = colors[1];
        break;
      case 2:
        strategy = new GTFT();
        fill = colors[2];
        break;
      case 3:
        strategy = new Grim();
        fill = colors[3];
        break;
      case 4:
        strategy = new Handshake();
        fill = colors[4];
        break;
      case 5:
        strategy = new Pavlov();
        fill = colors[5];
        break;
      case 6:
        strategy = new Random();
        fill = colors[6];
        break;
      case 7:
        strategy = new STFT();
        fill = colors[7];
        break;
      case 8:
        strategy = new TFT();
        fill = colors[8];
        break;
    }
  }
  
  void update(){
       brain.synapse();
       if(brain.step % 100 == 0){
         acc = new PVector(0, 0);
         vel = new PVector(0, 0);
         brain.newDirections(width + height);
       }
       acc.add(brain.getX(), brain.getY());
       vel.add(acc);
       vel.limit(1);
       pos.add(vel);
       
       if(pos.x - 14 <= 0 || pos.x + 14 >= width){
         vel.x *= -1;
       } 
       if(pos.y - 14 <= 0 || pos.y + 14 >= height){
         vel.y *= -1;
       }
       
       float[] p1 = new float[] {pos.x, pos.y};
       float[] p2 = new float[] {width/2, height/2};
       float x = (p2[0] - p1[0]) / (int)dist(pos.x, pos.y, width/2, height/2);
       float y = (p2[1] - p1[1]) / (int)dist(pos.x, pos.y, width/2, height/2);
       
       vel.add(x, y);
       vel.limit(1);
       pos.add(vel);
    }
  
  void show(){
    fill(fill.x, fill.y, fill.z);
    ellipse(pos.x, pos.y, 30, 30);
  }
}
