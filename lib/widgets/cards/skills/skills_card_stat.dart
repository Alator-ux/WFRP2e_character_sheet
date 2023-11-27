import 'package:flutter/material.dart';
import 'package:test_web/utils/text_style_storage.dart';

class SkillsCardStat extends StatelessWidget {
  final String stat;
  const SkillsCardStat(this.stat, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Center(
        child: Text(
          '($stat)',
          style: TextStyleStorage.bodySmall,
        ),
      ),
    );
  }
}
