import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  final List<String> buttons = [
    'C',
    '+/-',
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
    'DEL',
    '='
  ];

  final List<String> operators = ['/', 'x', '-', '+', '=', '%'];

  bool isOperator(String x) {
    if (operators.contains(x)) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Column(children: [
        Expanded(
          child: Container(),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return MyButton(
                    backgroundColour: Colors.red,
                    textColour: Colors.white,
                    buttonText: buttons[index],
                  );
                } else if (index == 1) {
                  return MyButton(
                    backgroundColour: Colors.green,
                    textColour: Colors.white,
                    buttonText: buttons[index],
                  );
                } else {
                  return MyButton(
                    backgroundColour: isOperator(buttons[index])
                        ? Colors.deepPurple
                        : Colors.deepPurple[50]!,
                    textColour: isOperator(buttons[index])
                        ? Colors.white
                        : Colors.deepPurple!,
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
