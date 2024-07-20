import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/i18n/strings.g.dart';

class I18nNotifier extends Notifier {
  // ignore: avoid_init_to_null
  BuildContext? context = null;

  I18nNotifier();

  late final Translations t;

  setContext(BuildContext ctx) {
    context = ctx;
    t = Translations.of(ctx);
  }

  switchTo(String locale) {
    LocaleSettings.setLocaleRaw(locale);
  }

  @override
  build() {}
}

final i18nProvider = NotifierProvider(() => I18nNotifier());
