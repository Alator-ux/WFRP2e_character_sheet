import 'package:flutter/material.dart';
import 'package:flutter_to_pdf/flutter_to_pdf.dart';
import 'package:test_web/utils/id_generator.dart';
import 'package:test_web/utils/pdf_exporter.dart';
import 'package:test_web/widgets/cards/character/character_card.dart';
import 'package:test_web/widgets/cards/details/details_card.dart';
import 'package:test_web/widgets/cards/skills/skills_card.dart';
import 'package:test_web/widgets/cards/talents/talents_card.dart';

class Sheet extends StatelessWidget {
  const Sheet({super.key});

  @override
  Widget build(BuildContext context) {
    var pdfExporter = PDFExporter.instance();
    var rootID = IDGenerator.genID();
    pdfExporter.setRootID(rootID);
    return ExportFrame(
      exportDelegate: pdfExporter.exportDelegate,
      frameId: rootID,
      child: const SizedBox(
        width: 725,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CharacterCard(),
                  DetailsCard(),
                  TalentsCard(),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SkillsCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
