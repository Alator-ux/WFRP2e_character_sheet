import 'package:flutter/material.dart';
import 'package:test_web/utils/id_generator.dart';
import 'package:test_web/utils/pdf_exporter.dart';
import 'package:test_web/widgets/buttons/download_button.dart';
import 'package:test_web/widgets/cards/character/character_card.dart';
import 'package:test_web/widgets/cards/details/details_card.dart';
import 'package:test_web/widgets/cards/skills/skills_card.dart';
import 'package:test_web/widgets/cards/talents/talents_card.dart';
// import 'package:flutter_to_pdf/flutter_to_pdf.dart';
import 'package:test_web/widgets/sheet.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DownloadButton(),
          Sheet(),
        ],
      ),
    );
  }
}
