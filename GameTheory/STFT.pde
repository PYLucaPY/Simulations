class STFT extends Strategy{
  @Override
  String get(String currentMove){
    this.name = "Sus Tit for Tat";
    try{ return previous; }
    finally{ previous = currentMove; }
  }
  @Override
  String get(){ return "D"; }
}
