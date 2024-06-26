import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/global/notifiers/duration_notifier.dart';
import 'package:make_a_dream/opening_page/components/buttons.dart';
import 'package:make_a_dream/opening_page/notifiers/blur_notifier.dart';

class OpeningPage extends ConsumerStatefulWidget {
  const OpeningPage({super.key});

  @override
  ConsumerState<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends ConsumerState<OpeningPage> {
  @override
  void initState() {
    super.initState();
    ref.read(durationNotifier);
  }

  @override
  Widget build(BuildContext context) {
    final blurState = ref.watch(blurProvider);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          ref.read(blurProvider.notifier).changeState();
        },
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/opening/designer.jpeg"),
                      fit: BoxFit.fitWidth)),
            ).blurred(
                blur: blurState ? 5 : 0, colorOpacity: blurState ? 0.1 : 0),
            Visibility(
              visible: blurState,
              child: const OpeningScreenButtons(),
            )
          ],
        ),
      ),
    );
  }
}
