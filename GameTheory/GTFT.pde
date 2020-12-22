class GTFT extends Strategy{
  @Override
  String get(String currentMove){
    this.name = "GFTF";
    try{
        String move = previous;
        if(move.equals("D") && random(1) < .5){
          move = "C";
        }
        return move;
     }
    finally{ previous = currentMove; }
  }
  @Override
  String get(){ return "C"; }
}
