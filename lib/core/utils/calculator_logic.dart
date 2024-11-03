import 'package:math_expressions/math_expressions.dart';
import 'package:intl/intl.dart';

class CalculatorLogic {
  static String processInput(String currentText, String input) {
    if (input == 'DEL') {
      return currentText.length > 1
          ? currentText.substring(0, currentText.length - 1)
          : '0';
    } else if (input == 'C') {
      return '0';
    } else if (input == '=') {
      return _calculateResult(currentText);
    } else if (input == '+/-') {
      return currentText.startsWith('-')
          ? currentText.substring(1)
          : '-$currentText';
    } else {
      return currentText == '0' ? input : currentText + input;
    }
  }

  static String _calculateResult(String expressionText) {
    try {
      String finalExpression =
          expressionText.replaceAll('×', '*').replaceAll('÷', '/');
      Parser parser = Parser();
      Expression expression = parser.parse(finalExpression);
      ContextModel contextModel = ContextModel();

      double result = expression.evaluate(EvaluationType.REAL, contextModel);

      // Format the result with commas
      return formatNumber(result);
    } catch (e) {
      return 'Error';
    }
  }

  static String formatNumber(double number) {
    // Format the number with commas
    final formatter = NumberFormat(
        '#,##0.00', 'en_US'); // You can adjust the format as needed
    return formatter
        .format(number)
        .replaceAll(RegExp(r'\.00$'), ''); // Remove decimal point if .00
  }
}
