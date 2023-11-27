// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class OverflowTrackingTextField extends StatefulWidget {
//   // final Function(String) onOverflow;

//   const OverflowTrackingTextField({super.key});

//   @override
//   State<OverflowTrackingTextField> createState() =>
//       _OverflowTrackingTextFieldState();
// }

// class _OverflowTrackingTextFieldState extends State<OverflowTrackingTextField> {
//   final TextEditingController _controller = TextEditingController();
//   final FocusNode _focusNode = FocusNode();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             color: Colors.blue,
//             child: EditableText(
//               onChanged: (String str) {
//                 setState(() {});
//               },
//               controller: _controller,
//               focusNode: _focusNode,
//               cursorColor: Colors.black,
//               backgroundCursorColor: Colors.white,
//               style: TextStyle(fontSize: 16.0),
//               textWidthBasis: TextWidthBasis.longestLine,
//               textAlign: TextAlign.start,
//               textCapitalization: TextCapitalization.none,

//               textScaleFactor: 1.0,
//             ),
//           ),
//           SizedBox(height: 8.0),
//           Text(
//             _controller.text,
//             style: TextStyle(fontSize: 16.0, color: Colors.grey),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:test_web/widgets/text_fields/blinking_cursor_text.dart';

class TextChip extends StatefulWidget {
  const TextChip({super.key});
  @override
  State<TextChip> createState() => _TextChipState();
}

class _TextChipState extends State<TextChip> {
  final _focus = FocusNode();
  final _controller = TextEditingController();
  String _text = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: InputChip(
        onPressed: () => FocusScope.of(context).requestFocus(_focus),
        label: Stack(
          alignment: Alignment.centerRight,
          //overflow: Overflow.visible,
          children: [
            TextField(
              scrollPadding: const EdgeInsets.all(0),
              focusNode: _focus,
              controller: _controller,
              style: const TextStyle(color: Colors.transparent),
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              onChanged: (_) {
                setState(() {
                  _text = _controller.text;
                });
              },
            ),
            Positioned(
              left: 0,
              child: BlinkingCursorText(_text, cursorPosition: 0),
            ),
          ],
        ),
      ),
    );
  }
}
