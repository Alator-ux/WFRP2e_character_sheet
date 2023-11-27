import 'package:flutter/material.dart';
import 'package:flutter_to_pdf/args/text_style.dart';
import 'package:test_web/utils/text_style_storage.dart';
import 'package:pdf/widgets.dart' as pw;

class CSCard extends StatelessWidget {
  final String label;
  final List<Widget> children;
  final bool addSpacesBetweenChilds;
  const CSCard(
      {super.key,
      required this.label,
      required this.children,
      this.addSpacesBetweenChilds = true});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 30,
            color: const Color.fromARGB(255, 44, 44, 44),
            child: Center(
              child: Text(label, style: TextStyleStorage.titleMedium),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: Column(
              children: addSpacesBetweenChilds
                  ? children.map((child) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 5),
                          SizedBox(child: child),
                        ],
                      );
                    }).toList()
                  : children,
            ),
          ),
        ],
      ),
    );
  }
}
