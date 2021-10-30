class Coins {
  int ten = 0;
  int five = 0;
  int two = 0;
  int one = 0;

  int total() {
    return ten + five + one + two;
  }

  int noOfNotes(String s) {
    if (s == "10")
      return (ten / 10).ceil();
    else if (s == "5")
      return (five / 5).ceil();
    else if (s == "2")
      return (two / 200).ceil();
    else if (s == "1") return (one / 1).ceil();

    return 0;
  }
}
