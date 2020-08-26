class Delta {
  int confirmed;
  int deceased;
  int recovered;

  Delta.fromJSON(Map results) {
    confirmed = results["confirmed"];
    deceased = results["deceased"];
    recovered = results["recovered"];
  }
}
