import 'package:flutter/material.dart';

class FillableButton extends StatefulWidget {
  const FillableButton({super.key});

  @override
  State<FillableButton> createState() => _FillableButtonState();
}

class _FillableButtonState extends State<FillableButton> {
  bool buttonFilled = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          buttonFilled = !buttonFilled;
        });
      },
      child: Container(
        width: 10.0,
        height: 10.0,
        decoration: BoxDecoration(
          color: buttonFilled
              ? Colors.grey.shade900
              : const Color.fromARGB(0, 105, 68, 68),
          border: Border.all(color: Colors.black),
        ),
      ),
    );
  }
}
