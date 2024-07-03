import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/components/play_status/widget_wrapper.dart';
import 'package:make_a_dream/global/notifiers/duration_notifier.dart';
import 'package:make_a_dream/game/notifiers/player_notifier.dart';

class PlayDurationWidget extends ConsumerStatefulWidget {
  const PlayDurationWidget({super.key});

  @override
  ConsumerState<PlayDurationWidget> createState() => _PlayDurationWidgetState();
}

class _PlayDurationWidgetState extends ConsumerState<PlayDurationWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      while (true) {
        await Future.delayed(const Duration(seconds: 1));
        if (mounted) {
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WidgetWrapper(
        child: Center(
      child: Text(
        DateTimeFormat.relative(
            ref.read(durationNotifier).add(
                Duration(seconds: ref.read(playerProvider).current!.duration)),
            levelOfPrecision: 8),
        style: const TextStyle(fontSize: 18),
      ),
    ));
  }
}
