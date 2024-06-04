import 'package:flutter/material.dart';

import 'player_status_page.dart';

class SettingButton extends StatelessWidget {
  const SettingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.bottomRight,
        child: FittedBox(
          child: Container(
            padding: const EdgeInsets.only(right: 20, bottom: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    showGeneralDialog(
                        context: context,
                        barrierColor: Colors.transparent,
                        pageBuilder: (c, _, __) {
                          return const Center(
                            child: PlayerStatusPage(),
                          );
                        });
                  },
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 40,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
