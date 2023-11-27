import 'package:flutter/material.dart';

class SkillsCardRow extends StatelessWidget {
  final List<Widget> children; // Length must be = 8
  const SkillsCardRow({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: children[0],
        ),
        Expanded(
          flex: 5,
          child: children[1],
        ),
        Expanded(
          flex: 2,
          child: children[2],
        ),
        Expanded(
          flex: 2,
          child: children[3],
        ),
        Expanded(
          flex: 2,
          child: children[4],
        ),
        Expanded(
          flex: 2,
          child: children[5],
        ),
        Expanded(
          flex: 3,
          child: children[6],
        ),
        Expanded(
          flex: 2,
          child: children[7],
        ),
      ],
    );
  }
}
