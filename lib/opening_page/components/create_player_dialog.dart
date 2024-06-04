import 'package:flutter/material.dart';
import 'package:make_a_dream/style/app_style.dart';

class CreatePlayerDialog extends StatelessWidget {
  CreatePlayerDialog({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        width: 300,
        height: 110,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: AppStyle.inputDecorationWithHint("Input your name"),
            ),
            Row(
              children: [
                const Expanded(child: SizedBox()),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(controller.text);
                    },
                    child: const Text("Done"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
