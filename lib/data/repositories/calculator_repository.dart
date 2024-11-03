import 'package:calcify/domain/entities/calculator_entity.dart';

class CalculatorRepository {
  final CalculateUseCase _calculateUseCase = CalculateUseCase();

  double calculate(String operation, double a, double b) {
    switch (operation) {
      case '+':
        return _calculateUseCase.add(a, b);
      case '-':
        return _calculateUseCase.subtract(a, b);
      case '*':
        return _calculateUseCase.multiply(a, b);
      case '/':
        return _calculateUseCase.divide(a, b);
      default:
        return 0;
    }
  }
}
