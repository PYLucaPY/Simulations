class Cooperator extends Strategy{
  @Override
  String get(String curr){ this.name = "Cooperator"; return "C"; }
  @Override
  String get(){ return "C"; }
}
