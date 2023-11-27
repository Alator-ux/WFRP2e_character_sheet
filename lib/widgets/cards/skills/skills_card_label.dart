import 'package:flutter/material.dart';
import 'package:test_web/utils/text_style_storage.dart';

class SkillsCardLabel extends StatelessWidget {
  final String label;
  const SkillsCardLabel(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        style: TextStyleStorage.labelSmall,
      ),
    );
  }
}
