import 'package:flutter/material.dart';
import 'package:test_web/utils/pdf_exporter.dart';

class DownloadButton extends StatefulWidget {
  final VoidCallback onPressed;
  const DownloadButton({super.key, required this.onPressed});

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  late VoidCallback onPressed;
  bool centerAlignment = false;
  @override
  void initState() {
    super.initState();
    onPressed = () {
      centerAlignment = !centerAlignment;
      widget.onPressed();
    };
  }

  // bool blocked = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        // onPressed: blocked
        //     ? null
        //     : () {
        //         blocked = true;
        //         PDFExporter.instance().exportToPDF().then((value) {
        //           blocked = false;
        //         });
        //       },
        child: centerAlignment
            ? const Text('Center alignment')
            : const Text('PDF alignment'));
  }
}
