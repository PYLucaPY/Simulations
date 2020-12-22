class Pavlov extends Strategy{
  Pavlov(){
    this.previous = "C";
    this.otherPrevious = "C";
    this.name = "Pavlov";
  }
  @Override
  String get(String current){
    try{ return previous.equals(otherPrevious) ? "C" : "D"; }
    finally{
      previous = previous.equals(otherPrevious) ? "C" : "D";
      otherPrevious = current;
    }
  }
  
  @Override
  String get(){ return "C"; }
  
}
