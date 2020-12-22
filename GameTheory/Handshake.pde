class Handshake extends Strategy{
  String first;
  String second;
  int currentMove = 1;
  @Override
  String get(String current){
    this.name = "Handshake";
    String move;
    if(currentMove == 1){ move = "D"; first = current; }
    else if(currentMove == 2){ move = "C"; second = current; }
    else{ move = first.equals("D") && second.equals("C") ? "C" : "D"; }
    return move;
  }
  @Override
  String get(){ currentMove++; return get("D"); }
}
