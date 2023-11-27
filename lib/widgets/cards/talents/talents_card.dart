import 'package:flutter/material.dart';
import 'package:test_web/widgets/cards/cs_card.dart';
import 'package:test_web/widgets/cards/talents/talents_card_row.dart';
import 'package:test_web/widgets/text_fields/card_text_field.dart';

class TalentsCard extends StatelessWidget {
  const TalentsCard({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> talentsRows = [];

    talentsRows.add(
      const TalentsCardRow(
        leftChild: Center(child: Text('Talent')),
        rightChild: Center(child: Text('Description')),
      ),
    );

    for (int i = 0; i < 18; i++) {
      talentsRows.add(
        const TalentsCardRow(
          leftChild: CardTextField(borderStyle: TextFieldBorderStyle.box),
          rightChild: CardTextField(borderStyle: TextFieldBorderStyle.box),
        ),
      );
    }
    return CSCard(
      label: 'Talents',
      addSpacesBetweenChilds: false,
      children: talentsRows,
    );
  }
}
