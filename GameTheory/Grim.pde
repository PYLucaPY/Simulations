class Grim extends Strategy{
  boolean chain = false;
  @Override
  String get(String currentMove){
    this.name = "Grim";
    String move = chain ? "D" : "C";
    if(!chain) chain = currentMove.equals("D");
    return move;
  }
  @Override
  String get(){ return "C"; }
}
