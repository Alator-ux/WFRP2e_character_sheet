import 'package:flutter/material.dart';
import 'package:test_web/widgets/cards/cs_card.dart';
import 'package:test_web/widgets/text_fields/card_text_field.dart';
import 'package:test_web/widgets/text_fields/multiline_card_text_field.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const CSCard(
      label: 'Character',
      children: [
        CardTextField(label: 'Name:'),
        // CardTextField(label: 'Race:'),
        // MultilineCardTextField(3, label: 'Career Path:'),
      ],
    );
  }
}
