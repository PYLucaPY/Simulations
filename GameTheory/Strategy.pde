public class Strategy{
  
  String previous = "C";
  String otherPrevious = "C";
  String name = "Strategy";
  
  String get(String curr){ return new String(); }
  String get(){ return new String(); }
  void edit(String newPrev){ this.previous = newPrev; }
}
