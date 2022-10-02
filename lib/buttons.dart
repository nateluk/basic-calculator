import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton(
      {required this.backgroundColour,
      required this.textColour,
      required this.buttonText,
      required this.buttonTapped});

  final backgroundColour;
  final textColour;
  final buttonText;
  final buttonTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: backgroundColour,
            child: Center(
                child: Text(
              buttonText,
              style: TextStyle(color: textColour, fontSize: 25),
            )),
          ),
        ),
      ),
    );
  }
}
