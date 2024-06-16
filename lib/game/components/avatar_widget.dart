import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class NpcAvatarWidget extends StatelessWidget {
  const NpcAvatarWidget({super.key, required this.avatar, required this.name});
  final String name;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
              child: ExtendedImage.file(File(avatar), shape: BoxShape.rectangle,
                  loadStateChanged: (state) {
            switch (state.extendedImageLoadState) {
              case LoadState.completed:
                return null;
              case LoadState.failed:
                return const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 40,
                );

              default:
                return const CircularProgressIndicator();
            }
          })),
          SizedBox(
              height: 20,
              child: Align(
                alignment: Alignment.center,
                child: Text(name, style: const TextStyle(fontSize: 20)),
              )),
        ],
      ),
    );
  }
}
