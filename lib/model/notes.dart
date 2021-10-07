class Notes {
  int twoThousand = 0;
  int fiveHundred = 0;
  int twoHundred = 0;
  int hundred = 0;
  int fifty = 0;
  int twenty = 0;
  int ten = 0;
  int five = 0;

  int total() {
    return twoThousand +
        twoHundred +
        twenty +
        ten +
        fifty +
        five +
        fiveHundred +
        hundred;
  }

  int noOfNotes(String s) {
    if (s == "2000")
      return (twoThousand / 2000).ceil();
    else if (s == "500")
      return (fiveHundred / 500).ceil();
    else if (s == "200")
      return (twoHundred / 200).ceil();
    else if (s == "100")
      return (hundred / 100).ceil();
    else if (s == "50")
      return (fifty / 50).ceil();
    else if (s == "20")
      return (twenty / 20).ceil();
    else if (s == "10")
      return (ten / 10).ceil();
    else
      return (five / 5).ceil();
  }
}
