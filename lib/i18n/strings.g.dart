/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 40 (20 per locale)
///
/// Built on 2024-07-20 at 06:53 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	zhCn(languageCode: 'zh', countryCode: 'CN', build: _StringsZhCn.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get lang => 'Please answer in English.';
	late final _StringsFountainEn fountain = _StringsFountainEn._(_root);
	late final _StringsGaoshiEn gaoshi = _StringsGaoshiEn._(_root);
	late final _StringsQuizEn quiz = _StringsQuizEn._(_root);
	late final _StringsAbilityFormEn ability_form = _StringsAbilityFormEn._(_root);
	late final _StringsChairEn chair = _StringsChairEn._(_root);
	late final _StringsTipsEn tips = _StringsTipsEn._(_root);
	late final _StringsButtonsEn buttons = _StringsButtonsEn._(_root);
}

// Path: fountain
class _StringsFountainEn {
	_StringsFountainEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get wish => 'You wish ...';
}

// Path: gaoshi
class _StringsGaoshiEn {
	_StringsGaoshiEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String error({required Object content}) => 'Answer is not correct because of ${content}';
}

// Path: quiz
class _StringsQuizEn {
	_StringsQuizEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String question({required Object content}) => 'Question is ${content}';
}

// Path: ability_form
class _StringsAbilityFormEn {
	_StringsAbilityFormEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get intro => 'Some special ability may be related to unlocking certain content.';
}

// Path: chair
class _StringsChairEn {
	_StringsChairEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get now => 'It\'s time!';
	String get not_now => 'It\'s not time yet, my friend...';
}

// Path: tips
class _StringsTipsEn {
	_StringsTipsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get rest_of_sages => 'rest of sages';
	String get fountain => 'Wishing Well';
	String get industrial_area => 'Industrial Area';
	String get lake => 'Lake';
	String get farm => 'Farm';
	String get dream_of_city => 'Dream of City';
	String get cars => 'Caution: Watch for Traffic';
	String get scarecrow => 'Still as death';
	String get classroom => 'No Running Inside';
}

// Path: buttons
class _StringsButtonsEn {
	_StringsButtonsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get b1 => 'New Game';
	String get b2 => 'Load Last';
	String get b3 => 'Settings';
	String get b4 => 'End';
}

// Path: <root>
class _StringsZhCn implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsZhCn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.zhCn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh-CN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsZhCn _root = this; // ignore: unused_field

	// Translations
	@override String get lang => '请用中文回答。';
	@override late final _StringsFountainZhCn fountain = _StringsFountainZhCn._(_root);
	@override late final _StringsGaoshiZhCn gaoshi = _StringsGaoshiZhCn._(_root);
	@override late final _StringsQuizZhCn quiz = _StringsQuizZhCn._(_root);
	@override late final _StringsAbilityFormZhCn ability_form = _StringsAbilityFormZhCn._(_root);
	@override late final _StringsChairZhCn chair = _StringsChairZhCn._(_root);
	@override late final _StringsTipsZhCn tips = _StringsTipsZhCn._(_root);
	@override late final _StringsButtonsZhCn buttons = _StringsButtonsZhCn._(_root);
}

// Path: fountain
class _StringsFountainZhCn implements _StringsFountainEn {
	_StringsFountainZhCn._(this._root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get wish => '你希望...';
}

// Path: gaoshi
class _StringsGaoshiZhCn implements _StringsGaoshiEn {
	_StringsGaoshiZhCn._(this._root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String error({required Object content}) => '回答错误。答案应该是**${content}**';
}

// Path: quiz
class _StringsQuizZhCn implements _StringsQuizEn {
	_StringsQuizZhCn._(this._root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String question({required Object content}) => '问题如下\n${content}';
}

// Path: ability_form
class _StringsAbilityFormZhCn implements _StringsAbilityFormEn {
	_StringsAbilityFormZhCn._(this._root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get intro => '某种特殊的能力，可能和解锁某些内容有关';
}

// Path: chair
class _StringsChairZhCn implements _StringsChairEn {
	_StringsChairZhCn._(this._root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get now => '是时候了！';
	@override String get not_now => '时机尚未成熟，我的朋友...';
}

// Path: tips
class _StringsTipsZhCn implements _StringsTipsEn {
	_StringsTipsZhCn._(this._root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get rest_of_sages => '贤者之歇';
	@override String get fountain => '许愿池';
	@override String get industrial_area => '工业区';
	@override String get lake => '水池';
	@override String get farm => '田园';
	@override String get dream_of_city => '梦之都';
	@override String get cars => '注意来往车辆';
	@override String get scarecrow => '一动不动，宛如死物';
	@override String get classroom => '室内禁止奔跑';
}

// Path: buttons
class _StringsButtonsZhCn implements _StringsButtonsEn {
	_StringsButtonsZhCn._(this._root);

	@override final _StringsZhCn _root; // ignore: unused_field

	// Translations
	@override String get b1 => '起';
	@override String get b2 => '承';
	@override String get b3 => '转';
	@override String get b4 => '合';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'lang': return 'Please answer in English.';
			case 'fountain.wish': return 'You wish ...';
			case 'gaoshi.error': return ({required Object content}) => 'Answer is not correct because of ${content}';
			case 'quiz.question': return ({required Object content}) => 'Question is ${content}';
			case 'ability_form.intro': return 'Some special ability may be related to unlocking certain content.';
			case 'chair.now': return 'It\'s time!';
			case 'chair.not_now': return 'It\'s not time yet, my friend...';
			case 'tips.rest_of_sages': return 'rest of sages';
			case 'tips.fountain': return 'Wishing Well';
			case 'tips.industrial_area': return 'Industrial Area';
			case 'tips.lake': return 'Lake';
			case 'tips.farm': return 'Farm';
			case 'tips.dream_of_city': return 'Dream of City';
			case 'tips.cars': return 'Caution: Watch for Traffic';
			case 'tips.scarecrow': return 'Still as death';
			case 'tips.classroom': return 'No Running Inside';
			case 'buttons.b1': return 'New Game';
			case 'buttons.b2': return 'Load Last';
			case 'buttons.b3': return 'Settings';
			case 'buttons.b4': return 'End';
			default: return null;
		}
	}
}

extension on _StringsZhCn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'lang': return '请用中文回答。';
			case 'fountain.wish': return '你希望...';
			case 'gaoshi.error': return ({required Object content}) => '回答错误。答案应该是**${content}**';
			case 'quiz.question': return ({required Object content}) => '问题如下\n${content}';
			case 'ability_form.intro': return '某种特殊的能力，可能和解锁某些内容有关';
			case 'chair.now': return '是时候了！';
			case 'chair.not_now': return '时机尚未成熟，我的朋友...';
			case 'tips.rest_of_sages': return '贤者之歇';
			case 'tips.fountain': return '许愿池';
			case 'tips.industrial_area': return '工业区';
			case 'tips.lake': return '水池';
			case 'tips.farm': return '田园';
			case 'tips.dream_of_city': return '梦之都';
			case 'tips.cars': return '注意来往车辆';
			case 'tips.scarecrow': return '一动不动，宛如死物';
			case 'tips.classroom': return '室内禁止奔跑';
			case 'buttons.b1': return '起';
			case 'buttons.b2': return '承';
			case 'buttons.b3': return '转';
			case 'buttons.b4': return '合';
			default: return null;
		}
	}
}
