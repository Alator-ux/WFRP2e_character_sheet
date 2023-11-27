import 'package:flutter/material.dart';
import 'package:test_web/widgets/text_fields/card_text_field.dart';

class DetailCardRow extends StatelessWidget {
  final String fLabel, sLabel;
  const DetailCardRow(this.fLabel, this.sLabel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CardTextField(label: fLabel)),
        const SizedBox(width: 20),
        Expanded(child: CardTextField(label: sLabel)),
      ],
    );
  }
}
