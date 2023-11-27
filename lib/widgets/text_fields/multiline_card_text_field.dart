import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_web/widgets/text_fields/card_text_field.dart';

class MultilineCardTextField extends StatefulWidget {
  final String? label;
  final int lines;
  const MultilineCardTextField(this.lines, {super.key, this.label});

  @override
  State<MultilineCardTextField> createState() => _MultilineCardTextFieldState();
}

class _MultilineCardTextFieldState extends State<MultilineCardTextField> {
  List<CardTextField> cardTextFields =
      List<CardTextField>.empty(growable: true);
  int currentTextInd = -1;

  @override
  void initState() {
    super.initState();

    var node = FocusNode(debugLabel: 'Multiline node 0');
    // node.addListener(() { })
    node.attach(context, onKey: _handleKeyPress);
    node.addListener(() {
      _onFocusChange(0);
    });
    var controller = TextEditingController();
    var ctf = CardTextField(
        label: widget.label,
        focusNode: node,
        textEditingController: controller);
    cardTextFields.add(ctf);

    for (var i = 1; i < widget.lines; i++) {
      node = FocusNode(debugLabel: 'Multiline node $i');
      node.attach(context, onKey: _handleKeyPress);
      node.addListener(() {
        _onFocusChange(i);
      });
      controller = TextEditingController();
      ctf = CardTextField(focusNode: node, textEditingController: controller);
      cardTextFields.add(ctf);
    }
  }

  bool _changeFocus(int direction) {
    var newTextInd = currentTextInd + direction;
    if (newTextInd < 0 || newTextInd >= cardTextFields.length) {
      return false;
    }
    debugPrint('Node direction changed');
    cardTextFields[newTextInd].focusNode!.requestFocus();
    return true;
  }

  void _onFocusChange(int ind) {
    if (cardTextFields[ind].focusNode!.hasFocus) {
      currentTextInd = ind;
    }
  }

  KeyEventResult _handleKeyPress(FocusNode node, RawKeyEvent event) {
    var result = KeyEventResult.ignored;
    if (event is RawKeyDownEvent) {
      // debugPrint(
      //     'Focus node ${node.debugLabel} got key event: ${event.logicalKey}');
      switch (event.logicalKey) {
        case LogicalKeyboardKey.arrowUp:
          result = KeyEventResult.handled;
          setState(() {
            _changeFocus(-1);
          });
          break;
        case LogicalKeyboardKey.arrowDown:
          result = KeyEventResult.handled;
          setState(() {
            _changeFocus(1);
          });
          break;
        // case LogicalKeyboardKey.arrow
        // default:
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: cardTextFields,
    );
  }
}
