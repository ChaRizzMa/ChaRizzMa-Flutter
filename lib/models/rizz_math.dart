class RizzCalculations {
  static double calculateInitialRizz(double selfRizz, double selfAttraction) {
    return (0.2 + 0.06 * ((selfRizz / 2) + (selfAttraction / 2))) * 100;
  }
}
