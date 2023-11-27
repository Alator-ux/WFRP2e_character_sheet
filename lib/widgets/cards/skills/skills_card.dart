import 'package:flutter/material.dart';
import 'package:test_web/standard_classes/pair.dart';
import 'package:test_web/widgets/cards/cs_card.dart';
import 'package:test_web/widgets/cards/skills/skills_card_label.dart';
import 'package:test_web/widgets/cards/skills/skills_card_row.dart';
import 'package:test_web/widgets/cards/skills/skills_card_skill_row.dart';

class SkillsCard extends StatelessWidget {
  final List<Pair<String>> _basicSkillsNameNChar = const [
    Pair('Animal Crate', 'Int'),
    Pair('Charm', 'Fel'),
    Pair('Command', 'Int'),
    Pair('Concealment', 'Ag'),
    Pair('Consume Alcohol', 'T'),
    Pair('Disguise', 'Fel'),
    Pair('Drive', 'S'),
    Pair('Evaluate', 'Int'),
    Pair('Gamble', 'Int'),
    Pair('Gossip', 'Fel'),
    Pair('Haggle', 'Fel'),
    Pair('Intimidate', 'S'),
    Pair('Outdoor Survival', 'Int'),
    Pair('Perception', 'Int'),
    Pair('Ride', 'Ag'),
    Pair('Row', 'S'),
    Pair('Scale Sheer Surface', 'S'),
    Pair('Search', 'Int'),
    Pair('Silent Move', 'Ag'),
    Pair('Swim', 'S'),
  ];
  final List<Pair<String>> _advancedSkillsNameNChar = const [
    Pair('Animal Training', 'Fel'),
    Pair('Blather', 'Fel'),
    Pair('Chanelling', 'WP'),
    Pair('Charm Animal', 'Fel'),
    Pair('Dodge Blow', 'Ag'),
    Pair('Follow Trail', 'Int'),
    Pair('Heal', 'Int'),
    Pair('Hypnotism', 'WP'),
    Pair('Lip Reading', 'Int'),
    Pair('Magical Sense', 'WP'),
    Pair('Navigation', 'Int'),
    Pair('Pick Lock', 'Ag'),
    Pair('Prepare Poison', 'Int'),
    Pair('Read/Write', 'Int'),
    Pair('Sail', 'Ag'),
    Pair('Set Trap', 'Ag'),
    Pair('Shadowing', 'Ag'),
    Pair('Sleight of Hand', 'Ag'),
    Pair('Torture', 'Fel'),
    Pair('Ventriloquism', 'Fel'),
  ];
  const SkillsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CSCard(
      label: 'Talents',
      addSpacesBetweenChilds: false,
      children: [
        const SkillsCardRow(
          children: [
            SkillsCardLabel('Taken'),
            SkillsCardLabel('Basic skills'),
            SkillsCardLabel('Total'),
            SkillsCardLabel('Char'),
            SkillsCardLabel('+10%'),
            SkillsCardLabel('+20%'),
            SkillsCardLabel('Related\nTalents'),
            SkillsCardLabel('Assoc\nChar'),
          ],
        ),
        ..._basicSkillsNameNChar
            .map(
              (nameNchar) => SizedBox(
                height: 20, //TODO это плохо, переделать
                child: SkillsCardSkillRow(
                  name: nameNchar.first,
                  char: nameNchar.second,
                ),
              ),
            )
            .toList(),
        const SizedBox(height: 5),
        const SkillsCardRow(
          children: [
            SkillsCardLabel('Taken'),
            SkillsCardLabel('Advanced skills'),
            SkillsCardLabel('Total'),
            SkillsCardLabel('Char'),
            SkillsCardLabel('+10%'),
            SkillsCardLabel('+20%'),
            SkillsCardLabel('Related\nTalents'),
            SkillsCardLabel('Assoc\nChar'),
          ],
        ),
        ..._advancedSkillsNameNChar
            .map(
              (nameNchar) => SizedBox(
                height: 20,
                child: SkillsCardSkillRow(
                  name: nameNchar.first,
                  char: nameNchar.second,
                ),
              ),
            )
            .toList(),
      ],
    );
  }
}
