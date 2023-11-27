import 'package:flutter/material.dart';
import 'package:test_web/standard_classes/pair.dart';
import 'package:test_web/widgets/cards/details/detail_card_row.dart';
import 'package:test_web/widgets/cards/cs_card.dart';
import 'package:test_web/widgets/text_fields/card_text_field.dart';

class DetailsCard extends StatelessWidget {
  final List<Pair<String>> fieldLabels = const [
    Pair('Gender:', 'Age:'),
    Pair('Date of Birth:', 'Birthplace:'),
    Pair('Nationality:', 'Religion:'),
    Pair('Height:', 'Weight:'),
    Pair('Eyes:', 'Hair:'),
  ];
  const DetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CSCard(
        label: 'Personal Details',
        children: fieldLabels
            .map<Widget>(
                (labelPair) => DetailCardRow(labelPair.first, labelPair.second))
            .toList()
          ..add(const CardTextField(label: 'Distinguishing Marks:')));
  }
}
