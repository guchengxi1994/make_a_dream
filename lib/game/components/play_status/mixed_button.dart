import 'package:flutter/material.dart';

class MixedButton extends StatefulWidget {
  const MixedButton(
      {super.key,
      required this.onLongPressed,
      required this.onTap,
      required this.child,
      this.hoverColor,
      this.splashColor});
  final VoidCallback onTap;
  final VoidCallback onLongPressed;
  final Widget child;
  final Color? splashColor;
  final Color? hoverColor;

  @override
  State<MixedButton> createState() => _MixedButtonState();
}

class _MixedButtonState extends State<MixedButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressEnd: (details) {
        isPressed = false;
      },
      onLongPress: () async {
        if (isPressed) {
          return;
        }

        isPressed = true;

        while (isPressed) {
          widget.onLongPressed();
          await Future.delayed(const Duration(milliseconds: 250));
        }
      },
      child: InkWell(
        onTap: () {
          widget.onTap();
        },
        splashColor: widget.hoverColor ?? Colors.green.withOpacity(0.2),
        highlightColor: Colors.transparent,
        hoverColor: widget.hoverColor ?? Colors.green.withOpacity(0.5),
        focusColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), border: Border.all()),
          width: 30,
          height: 30,
          child: widget.child,
        ),
      ),
    );
  }
}
