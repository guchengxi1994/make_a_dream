import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/maps/multiple_maps_route.dart';
import 'package:make_a_dream/global/ai_client.dart';
import 'package:make_a_dream/opening_page/components/create_player_dialog.dart';
import 'package:make_a_dream/opening_page/notifiers/player_notifier.dart';

typedef OnTap = void Function(BuildContext context, WidgetRef ref);

class ButtonModel {
  final int debugLabel;
  final String content;
  final OnTap? onTap;
  ButtonModel(
      {required this.content, required this.debugLabel, required this.onTap});

  @override
  bool operator ==(Object other) {
    if (other is! ButtonModel) {
      return false;
    }
    return other.debugLabel == debugLabel;
  }

  @override
  int get hashCode => debugLabel.hashCode;
}

class ButtonState {
  final List<ButtonModel> models;
  final ButtonModel? current;
  ButtonState({required this.current, this.models = const []});

  ButtonState copyWith({ButtonModel? current, List<ButtonModel>? models}) {
    return ButtonState(
        current: current ?? this.current, models: models ?? this.models);
  }
}

class ButtonsNotifier extends AutoDisposeNotifier<ButtonState> {
  static List<ButtonModel> defaultModels = [
    ButtonModel(
      debugLabel: 1,
      content: "起",
      onTap: (context, ref) async {
        final String? name = await showGeneralDialog(
            barrierColor: Colors.transparent,
            barrierDismissible: true,
            barrierLabel: "new-player",
            context: context,
            pageBuilder: (c, _, __) {
              return Center(
                child: CreatePlayerDialog(),
              );
            });

        if (name != null) {
          ref.read(playerProvider.notifier).createNewRecord(name).then((id) {
            AiClient aiClient = AiClient();
            aiClient.initialAllNpcs(id).then((_) {
              MultipleMapsRoute.open(context);
            });
          });
        }
      },
    ),
    ButtonModel(
      content: "承",
      debugLabel: 2,
      onTap: (context, ref) {
        final playerState = ref.read(playerProvider);
        final last = playerState.records.lastOrNull;
        if (last == null) {
          return;
        }

        ref.read(playerProvider.notifier).changeCurrent(last);
        MultipleMapsRoute.open(context);
      },
    ),
    ButtonModel(content: "转", debugLabel: 3, onTap: null),
    ButtonModel(
        content: "合",
        debugLabel: 4,
        onTap: (_, __) {
          exit(0);
        }),
  ];

  @override
  ButtonState build() {
    return ButtonState(current: defaultModels.first, models: defaultModels);
  }

  changeState(ButtonModel? s) {
    if (s != state.current) {
      state = state.copyWith(current: s);
    }
  }

  changeStateWithDebugLabel(int label) {
    if (state.current == null || state.current!.debugLabel != label) {
      final c = defaultModels.where((v) => v.debugLabel == label).first;

      state = state.copyWith(current: c);
    }
  }

  ButtonModel getById(int id) {
    return defaultModels.where((v) => v.debugLabel == id).first;
  }

  void next() {
    if (state.current == null) {
      return;
    }

    int id = state.current!.debugLabel + 1;
    if (id == 5) {
      id = 1;
    }
    while (true) {
      if (getById(id).onTap == null) {
        id++;
      } else {
        break;
      }
    }
    if (id == 5) {
      id = 1;
    }

    changeStateWithDebugLabel(id);
  }

  void previous() {
    if (state.current == null) {
      return;
    }

    int id = state.current!.debugLabel - 1;
    if (id == 0) {
      id = 4;
    }
    while (true) {
      if (getById(id).onTap == null) {
        id--;
      } else {
        break;
      }
    }

    if (id == 0) {
      id = 4;
    }

    changeStateWithDebugLabel(id);
  }
}

final buttonProvider =
    AutoDisposeNotifierProvider<ButtonsNotifier, ButtonState>(
        () => ButtonsNotifier());
