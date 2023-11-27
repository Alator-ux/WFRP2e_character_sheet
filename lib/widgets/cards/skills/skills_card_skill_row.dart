import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_web/utils/text_style_storage.dart';
import 'package:test_web/widgets/buttons/fillable_button.dart';
import 'package:test_web/widgets/cards/skills/skills_card_row.dart';
import 'package:test_web/widgets/cards/skills/skills_card_stat.dart';
import 'package:test_web/widgets/text_fields/card_text_field.dart';

class SkillsCardSkillRow extends StatelessWidget {
  final String name, char;
  const SkillsCardSkillRow({super.key, required this.name, required this.char});

  @override
  Widget build(BuildContext context) {
    return SkillsCardRow(
      children: [
        const Center(child: FillableButton()),
        Text(
          name,
          style: TextStyleStorage.bodyMedium,
        ),
        const CardTextField(
          textAlign: TextAlign.center,
          borderStyle: TextFieldBorderStyle.box,
        ),
        CardTextField(
          textAlign: TextAlign.center,
          borderStyle: TextFieldBorderStyle.box,
          initValue: '0',
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
          ],
        ),
        const Center(child: FillableButton()),
        const Center(child: FillableButton()),
        const CardTextField(
          textAlign: TextAlign.center,
          borderStyle: TextFieldBorderStyle.box,
        ),
        SkillsCardStat(char),
      ],
    );
  }
}
