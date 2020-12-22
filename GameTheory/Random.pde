class Random extends Strategy{
  @Override
  String get(String curr){ this.name = "Random"; return random(1) < .5 ? "C" : "D"; }
  @Override
  String get(){ return get("C"); }
}
