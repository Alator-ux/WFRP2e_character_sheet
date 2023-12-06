import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_web/utils/text_style_storage.dart';
import 'package:test_web/utils/text_width_meter.dart';

enum TextFieldBorderStyle { underline, box }

class CardTextField extends StatefulWidget {
  final String? label;
  final FocusNode? focusNode;
  final TextEditingController? textEditingController;
  final TextFieldBorderStyle borderStyle;
  final TextAlign textAlign;
  final String initValue;
  final List<TextInputFormatter> inputFormatters;
  final double height;
  final double verticalContentPadding;
  // final String id = IDGenerator.genID();
  const CardTextField({
    super.key,
    this.label,
    this.borderStyle = TextFieldBorderStyle.underline,
    this.textAlign = TextAlign.left,
    this.initValue = '',
    this.inputFormatters = const [],
    this.focusNode,
    this.textEditingController,
    this.height = 20,
    this.verticalContentPadding = 8.0,
  });

  @override
  State<CardTextField> createState() => _CardTextFieldState();
}

class _CardTextFieldState extends State<CardTextField> {
  TextEditingController textEditingController = TextEditingController();
  double textFieldWidth = 0;
  String oldText = '';
  @override
  void initState() {
    super.initState();

    if (widget.textEditingController != null) {
      textEditingController = widget.textEditingController!;
    }
    textEditingController.text = widget.initValue;
    textEditingController.addListener(() {
      if (oldText.length == textEditingController.text.length) {
        return;
      }
      var textWidth = textWidthMeter(
          textEditingController.text, TextStyleStorage.bodyMedium,
          scaleFactor: MediaQuery.of(context).textScaleFactor);
      if (textWidth > textFieldWidth - 5) {
        textEditingController.text = oldText;
        textEditingController.selection =
            TextSelection.collapsed(offset: oldText.length);
      } else {
        oldText = textEditingController.text;
      }
    });
    // textEditingController.text = widget.initValue;
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> leftSide = [];
    if (widget.label != null) {
      leftSide.add(Text(widget.label!, style: TextStyleStorage.bodyMedium));
      leftSide.add(const SizedBox(width: 10));
    }

    InputBorder borderStyle;
    if (widget.borderStyle == TextFieldBorderStyle.underline) {
      borderStyle = const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      );
    } else {
      borderStyle = const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.zero,
      );
    }

    return SizedBox(
      height: widget.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ...leftSide,
          Flexible(
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              textFieldWidth = constraints.maxWidth;
              return TextField(
                textAlign: widget.textAlign,
                textAlignVertical: TextAlignVertical.center,
                focusNode: widget.focusNode,
                controller: textEditingController,
                inputFormatters: widget.inputFormatters,
                style: TextStyleStorage.bodyMedium,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: widget.verticalContentPadding),
                  isDense: true,
                  focusedBorder: borderStyle,
                  enabledBorder: borderStyle,
                  border: borderStyle,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
