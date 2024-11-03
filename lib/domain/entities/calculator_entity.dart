class CalculatorEntity {
  final double result;
  const CalculatorEntity(this.result);
}

class CalculateUseCase {
  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;
  double divide(double a, double b) => b != 0 ? a / b : double.infinity;
}
