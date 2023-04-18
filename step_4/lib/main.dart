// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String display = '';

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        display = '';
      } else if (buttonText == '=') {
        display = evaluateExpression(display);
      } else {
        display += buttonText;
      }
    });
  }

  String evaluateExpression(String expression) {
    if (expression.isEmpty) {
      return 'Error';
    }
    try {
      return eval(expression).toString();
    } catch (e) {
      return 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                display,
                style: const TextStyle(fontSize: 48.0),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('7'),
              buildButton('8'),
              buildButton('9'),
              buildButton('/'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
              buildButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
              buildButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('C'),
              buildButton('0'),
              buildButton('='),
              buildButton('+'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildButton(String buttonText) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }

  num eval(String expression) {
    //This line creates a regular expression that matches either one or more
    //digits or a decimal point OR any of the arithmetic operators -, +, *, or /
    final regExp = RegExp(r'([\d\.]+|[-+*/])');

    //This line matches the regular expression regExp against the expression
    //string and returns all the matches as an iterable of Match objects.
    //The map() function is then called on this iterable to extract the matched
    //strings from each Match object, and the toList() method is used to convert
    //the resulting iterable to a list of strings
    final tokens =
        regExp.allMatches(expression).map((match) => match.group(0)).toList();

    //This line initializes a variable result with the numeric value of the
    //first token in the tokens list, which is assumed to be a number.
    //The ! operator is used to indicate that we know tokens[0] will never
    //be null or undefined.
    num result = num.parse(tokens[0]!);

    //This line starts a for loop that iterates over every other token in the
    //tokens list, starting from the second token (i=1) and incrementing by 2 each time.
    for (int i = 1; i < tokens.length; i += 2) {
      final op = tokens[i];

      //This line extracts the number that follows the operator in the current
      //token and stores it in a final variable right.
      final right = num.parse(tokens[i + 1]!);

      switch (op) {
        case '+':
          result += right;
          break;
        case '-':
          result -= right;
          break;
        case '*':
          result *= right;
          break;
        case '/':
          if (right == 0) {
            return double.infinity;
          }
          result /= right;
          break;
      }
    }
    return result;
  }
}
