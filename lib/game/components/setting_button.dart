import 'package:flutter/material.dart';

class SettingButton extends StatelessWidget {
  const SettingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          padding: const EdgeInsets.only(right: 20, bottom: 20),
          child: InkWell(
            onTap: () {},
            child: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
