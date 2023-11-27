import 'package:pdf/widgets.dart' as pw;
import 'dart:typed_data';


class PDFExporter {
  static PDFExporter? _instance;

  final ExportDelegate exportDelegate;
  String rooID = '';

  PDFExporter(ExportOptions options)
      : exportDelegate = ExportDelegate(options: options);

  static PDFExporter instance() {
    _instance ??= PDFExporter(
      const ExportOptions(
        pageFormatOptions: PageFormatOptions.a4(),
      ),
    );
    return _instance!;
  }

  void setRootID(String id) {
    rooID = id;
  }

  Future<void> exportToPDF() async {
    var document = pw.Document();
    if (rooID.isNotEmpty) {
      document = await exportDelegate.exportToPdfDocument(rooID);
    }
    var savedFile = Uint8List.fromList(await document.save());

    final blob = html.Blob([savedFile]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..target = 'webbrowser'
      ..download = 'wfrp_character_sheet.pdf'
      ..click();

    html.Url.revokeObjectUrl(url);
  }
}

// class PDFExporter {
//   static PDFExporter? _instance;

//   final ExportDelegate exportDelegate;
//   String rooID = '';

//   PDFExporter(ExportOptions options)
//       : exportDelegate = ExportDelegate(options: options);

//   static PDFExporter instance() {
//     _instance ??= PDFExporter(
//       const ExportOptions(
//         pageFormatOptions: PageFormatOptions.a4(),
//       ),
//     );
//     return _instance!;
//   }