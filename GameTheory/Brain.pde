class Brain{
  private PVector[] directions;
  private PVector vel = new PVector(0, 0);
  private float ellipson = 0.01;
  private float brainSize;
  
  int step = 0;
  float speed = 20;
  
  void synapse(){
    float size = (int)((width+height) / 2);
    vel.add(directions[step]);
    step ++;
    if(step >= size){
      step = 0;
    }
  }
    
  void setDirections(PVector[] newDirections){
    this.directions = newDirections;
  }
  
  Brain copy(){
    Brain clone = new Brain((int)brainSize);
    clone.setDirections(this.directions);
    clone.setEllipson(ellipson);
    
    return clone;
    
  }
  
  void setEllipson(float newEllipson){
    ellipson = newEllipson;
  }
  
  float getX(){
    return vel.x;
  }
  
  float getY(){
    return vel.y;
  }
  
  void newDirections(int size){
    directions = new PVector[size];
    brainSize = size;
    for(int j = 0; j < size; j++){
       directions[j] = PVector.fromAngle(random(2*PI)); 
    }
  }
  
 Brain(int size) {
    newDirections(size);
  }
}
