import 'package:flutter/material.dart';
import 'package:test_web/utils/pdf_exporter.dart';

class DownloadButton extends StatefulWidget {
  const DownloadButton({super.key});

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  bool blocked = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: blocked
            ? null
            : () {
                blocked = true;
                PDFExporter.instance().exportToPDF().then((value) {
                  blocked = false;
                });
              },
        child: const Text('To PDF'));
  }
}
