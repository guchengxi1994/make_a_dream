import 'package:flutter/material.dart';

typedef OnTap = void Function(String);

class FountainOptionButton extends StatefulWidget {
  const FountainOptionButton(
      {super.key, required this.option, required this.onTap});
  final String option;
  final OnTap onTap;

  @override
  State<FountainOptionButton> createState() => _FountainOptionButtonState();
}

class _FountainOptionButtonState extends State<FountainOptionButton> {
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          focused = true;
        });
      },
      onExit: (event) {
        setState(() {
          focused = false;
        });
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          widget.onTap(widget.option);
        },
        child: Container(
          height: 50,
          padding: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: focused
                  ? Colors.lightBlue.withOpacity(0.5)
                  : Colors.transparent),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.option,
              style: TextStyle(
                  color: focused ? Colors.white : Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
