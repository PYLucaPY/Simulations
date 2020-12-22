class Defector extends Strategy{
  @Override
  String get(String curr){ this.name = "Defector"; return "D"; }
  @Override
  String get(){ return "D"; }
}
