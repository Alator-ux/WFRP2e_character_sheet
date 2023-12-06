import 'package:flutter/material.dart';
import 'package:test_web/widgets/buttons/download_button.dart';
// import 'package:flutter_to_pdf/flutter_to_pdf.dart';
import 'package:test_web/widgets/sheet.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var contentHorizontalAlignment = MainAxisAlignment.center;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: contentHorizontalAlignment,
              children: [
                const Sheet(),
                DownloadButton(
                  onPressed: () {
                    setState(() {
                      contentHorizontalAlignment =
                          contentHorizontalAlignment == MainAxisAlignment.center
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.center;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
