import 'dart:io';

import 'package:flutter/material.dart';
import 'package:make_a_dream/game/components/play_status/widget_wrapper.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key, this.path});
  final String? path;

  @override
  Widget build(BuildContext context) {
    return WidgetWrapper(
        child: SizedBox.expand(
      child: path == null
          ? Image.asset(
              "assets/avatars/yeti.jpeg",
              fit: BoxFit.fitHeight,
            )
          : Image.file(File(path!)),
    ));
  }
}
