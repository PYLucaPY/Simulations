import java.util.*;
Agent[] agents = new Agent[50];
PVector[] colors = new PVector[9];

void setup(){
  fullScreen();
  for(int j = 0; j < colors.length; j++){
    colors[j] = new PVector((int)(random(255)), (int)(random(255)), (int)(random(255)));
  }
  for(int j = 0; j < agents.length; j++){
    agents[j] = new Agent((int)random(width), (int)random(height), colors);
  }
}

void draw(){
  background(255);
  for(int j = 0; j < agents.length; j++){
    for(int i = 0; i < agents.length; i++){
      if(j != i){
        if(dist(agents[j].pos.x, agents[j].pos.y, agents[i].pos.x, agents[i].pos.y) < 30 && dist(agents[j].pos.x, agents[j].pos.y, width/2, height/2) > 15){
          Agent one = new Agent(0, 0, colors);
          one.updateStrat(agents[j].stratVal);
          Agent two = new Agent(0, 0, colors);
          two.updateStrat(agents[i].stratVal);
          int[] scores = Prison.play(one, two);
          if(scores[0] > scores[1]){
            agents[i].updateStrat(agents[j].stratVal);
          }
          else if(scores[0] < scores[1]){
            agents[j].updateStrat(agents[i].stratVal);
          }
        }
      }
    }
    agents[j].update();
    agents[j].show();
  }
  fill(0, 0, 0, 110);
  rect(width/2 + width/3, 0, width/2, height);
  int y = 40;
  
  for(int j = 0; j < 9; j++){
    PVector c = colors[j];
    int pop = 0;
    Agent test = new Agent(0, 0, colors);
    test.updateStrat(j);
    test.strategy.get("C");
    String name = test.strategy.name;
    fill(c.x, c.y, c.z);
    ellipse(width/2 + width/3 + 20, y, 20, 20);
    for(int i = 0; i < agents.length; i++){
      if(agents[i].stratVal == j){
        pop++;
      }
    }
    fill(255);
    text(name + "  :   Population   :   " + pop, width/2 + width/3 + 50, y+5);
    y += 40;
  }
  
  
  
}
