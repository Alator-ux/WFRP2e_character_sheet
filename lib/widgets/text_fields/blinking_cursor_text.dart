import 'package:flutter/material.dart';

class BlinkingCursorText extends StatefulWidget {
  final String content;
  final TextStyle? style;
  final int cursorPosition;
  const BlinkingCursorText(this.content,
      {super.key, this.style, this.cursorPosition = 0});
  @override
  State<BlinkingCursorText> createState() => _BlinkingCursorTextState();
}

class _BlinkingCursorTextState extends State<BlinkingCursorText>
    with TickerProviderStateMixin {
  late AnimationController _cursorController;

  @override
  void initState() {
    super.initState();
    _cursorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle;
    if (widget.style == null) {
      textStyle = const TextStyle(fontSize: 16.0);
    } else {
      textStyle =
          widget.style!.copyWith(fontSize: widget.style!.fontSize ?? 16.0);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: widget.content.substring(0, widget.cursorPosition),
            style: textStyle,
            children: [
              WidgetSpan(
                child: AnimatedBuilder(
                  animation: _cursorController,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _cursorController.value > 0.5 ? 1.0 : 0.0,
                      child: Text(
                        '|',
                        style: textStyle.copyWith(
                          fontSize: textStyle.fontSize! + 6.0,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Text(
          widget.content.substring(widget.cursorPosition),
          style: widget.style,
        )
      ],
    );
  }

  @override
  void dispose() {
    _cursorController.dispose();
    super.dispose();
  }
}
