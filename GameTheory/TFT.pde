class TFT extends Strategy{
  @Override
  String get(String currentMove){
    this.name = "Tit for tat";
    try{ return previous; }
    finally{ previous = currentMove; }
  }
  @Override
  String get(){ return "C"; }
}
