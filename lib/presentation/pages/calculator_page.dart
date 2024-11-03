import 'package:calcify/core/utils/calculator_logic.dart';
import 'package:flutter/material.dart';
import '../widgets/display_panel.dart';
import '../widgets/calculator_button.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String displayText = '0';

  void onButtonPressed(String value) {
    setState(() {
      displayText = CalculatorLogic.processInput(displayText, value);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DisplayPanel(displayText: displayText),
            _buildNumberPad(screenWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberPad(double screenWidth) {
    double buttonSize = screenWidth * 0.18;
    const specialButtonColor = Color(0xFF444444);
    const operationButtonColor = Colors.orange;
    const numberButtonColor = Color(0xFF333333);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          _buildButtonRow(['DEL', '+/-', '%', '÷'], buttonSize,
              specialButtonColor, operationButtonColor),
          _buildButtonRow(['7', '8', '9', '×'], buttonSize, numberButtonColor,
              operationButtonColor),
          _buildButtonRow(['4', '5', '6', '-'], buttonSize, numberButtonColor,
              operationButtonColor),
          _buildButtonRow(['1', '2', '3', '+'], buttonSize, numberButtonColor,
              operationButtonColor),
          _buildButtonRow(['C', '0', '.', '='], buttonSize, specialButtonColor,
              operationButtonColor),
        ],
      ),
    );
  }

  Widget _buildButtonRow(List<String> values, double size, Color normalColor,
      Color operatorColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: values.map((value) {
        return CalculatorButton(
          value: value,
          size: size,
          color: (value == '÷' ||
                  value == '×' ||
                  value == '-' ||
                  value == '+' ||
                  value == '=')
              ? operatorColor
              : normalColor,
          onPressed: () => onButtonPressed(value),
        );
      }).toList(),
    );
  }
}
