import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String equationInputs = '';
  String answer = '0';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    '+/-',
    '='
  ];

  final List<String> operators = ['/', 'x', '-', '+', '%'];

  bool isOperator(String x) {
    if (operators.contains(x)) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    void evaluateExpression() {
      Parser p = Parser();
      Expression exp = p.parse(equationInputs);
      double expAnswer = exp.evaluate(EvaluationType.REAL, ContextModel());
      answer = expAnswer.toString();
    }

    void createPercentage() {
      Parser p = Parser();
      Expression exp = p.parse(equationInputs);
      double expAnswer = exp.evaluate(EvaluationType.REAL, ContextModel());
      answer = expAnswer.toString();
    }

    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Column(children: [
        Expanded(
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                child: Text(
                  equationInputs,
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                child: Text(
                  answer,
                  style: TextStyle(fontSize: 45),
                ),
              ),
            ],
          )),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: GridView.builder(
              itemCount: buttons.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (context, index) {
                // clear button
                if (index == 0) {
                  return MyButton(
                    buttonTapped: () {
                      setState(() {
                        equationInputs = '';
                        answer = '0';
                      });
                    },
                    backgroundColour: Colors.red,
                    textColour: Colors.white,
                    buttonText: buttons[index],
                  );
                }

                // delete button
                else if (index == 1) {
                  return MyButton(
                    buttonTapped: () {
                      if (equationInputs.isNotEmpty) {
                        setState(() {
                          equationInputs = equationInputs.substring(
                              0, equationInputs.length - 1);
                        });
                      }
                    },
                    backgroundColour: Colors.green,
                    textColour: Colors.white,
                    buttonText: buttons[index],
                  );
                } else if (buttons[index] == '%') {
                  return MyButton(
                    buttonTapped: () {
                      setState(() {
                        evaluateExpression();
                      });
                    },
                    backgroundColour: isOperator(buttons[index])
                        ? Colors.deepPurple
                        : Colors.deepPurple[50],
                    textColour: isOperator(buttons[index])
                        ? Colors.white
                        : Colors.deepPurple,
                    buttonText: buttons[index],
                  );
                }

                // equals btton
                else if (buttons[index] == '=') {
                  return MyButton(
                    buttonTapped: () {
                      setState(() {
                        evaluateExpression();
                      });
                    },
                    backgroundColour: isOperator(buttons[index])
                        ? Colors.deepPurple
                        : Colors.deepPurple[50],
                    textColour: isOperator(buttons[index])
                        ? Colors.white
                        : Colors.deepPurple,
                    buttonText: buttons[index],
                  );
                }

                // other buttons
                else {
                  return MyButton(
                    buttonTapped: () {
                      setState(() {
                        equationInputs += buttons[index];
                      });
                    },
                    backgroundColour: isOperator(buttons[index])
                        ? Colors.deepPurple
                        : Colors.deepPurple[50],
                    textColour: isOperator(buttons[index])
                        ? Colors.white
                        : Colors.deepPurple,
                    buttonText: buttons[index],
                  );
                }
              },
            ),
          ),
        ),
      ]),
    );
  }
}
