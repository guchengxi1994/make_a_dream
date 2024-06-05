import 'package:flutter_riverpod/flutter_riverpod.dart';

class DurationNotifier extends Notifier<DateTime> {
  @override
  DateTime build() {
    return DateTime.now();
  }

  refresh() {
    state = DateTime.now();
  }

  int getDuration() {
    return DateTime.now().difference(state).inSeconds;
  }
}

final durationNotifier = NotifierProvider<DurationNotifier, DateTime>(
  () => DurationNotifier(),
);
