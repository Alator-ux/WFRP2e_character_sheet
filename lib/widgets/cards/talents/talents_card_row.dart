import 'package:flutter/material.dart';

class TalentsCardRow extends StatelessWidget {
  final Widget leftChild, rightChild;
  const TalentsCardRow(
      {super.key, required this.leftChild, required this.rightChild});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: leftChild,
        ),
        Flexible(
          flex: 2,
          child: Center(
            child: rightChild,
          ),
        ),
      ],
    );
  }
}
