static class Prison {
  public static int[] play(Agent one, Agent two) {
    int[] scores = new int[2];
    int scoreOne = 0;
    int scoreTwo = 0;
    Strategy strategyOne = one.strategy;
    Strategy strategyTwo = two.strategy;
    String resultOne, resultTwo;
    resultOne = strategyOne.get();
    resultTwo = strategyTwo.get();
    strategyTwo.edit(resultOne);
    strategyOne.edit(resultTwo);
    for(int j = 0; j < 50;  j++) {
      if (j > 0) {
        resultOne = strategyOne.get(resultTwo);
        resultTwo = strategyTwo.get(resultOne);
      }
      if(resultOne.equals("C") && resultTwo.equals("C")){
        scoreOne += 3;
        scoreTwo += 3;
      }
      if(resultOne.equals("D") && resultTwo.equals("D")){
        scoreOne -= 1;
        scoreTwo -= 1;
      }
      if(resultOne.equals("C") && resultTwo.equals("D")){
        scoreOne -= 5;
        scoreTwo += 5;
      }
      if(resultOne.equals("D") && resultTwo.equals("C")){
        scoreOne += 5;
        scoreTwo -= 5;
      }
    }
    return new int[] {scoreOne, scoreTwo};
  }
}
