import 'package:flutter/material.dart';

abstract class ILocalizationManager {
  String? localePath;
  List<Locale> get supportedLocales;
  LocalizationEnum currentLocale = LocalizationEnum.ENGLISH;
}

enum LocalizationEnum { TURKCE, ENGLISH, SPANISH, FRENCH }

extension LocalizationExtension on LocalizationEnum {
  Locale get translate {
    switch (this) {
      case LocalizationEnum.TURKCE:
        return LocalizationManager.instance.trTRLocale;
      case LocalizationEnum.ENGLISH:
        return LocalizationManager.instance.enUSLocale;
      case LocalizationEnum.SPANISH:
        return LocalizationManager.instance.esESLocale;
      case LocalizationEnum.FRENCH:
        return LocalizationManager.instance.frFRLocale;
      default:
        return LocalizationManager.instance.enUSLocale;
    }
  }
}

class LocalizationManager with ILocalizationManager {
  static LocalizationManager? _instance;
  static LocalizationManager get instance {
    _instance ??= LocalizationManager._init();
    return _instance!;
  }

  LocalizationManager._init();

  @override
  String? localePath = 'assets/translations';

  final enUSLocale = const Locale('en', 'US');
  final trTRLocale = const Locale('tr', 'TR');
  final frFRLocale = const Locale('fr', 'FR');
  final esESLocale = const Locale('es', 'ES');

  @override
  List<Locale> get supportedLocales =>
      [enUSLocale, trTRLocale, frFRLocale, esESLocale];

  @override
  LocalizationEnum currentLocale = LocalizationEnum.ENGLISH;
}


// <--------------  HOW TO USE  -------------->

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized(); 
//   await EasyLocalization.ensureInitialized(); 


//   runApp(const MultilanguageApp());
// }

// class MultilanguageApp extends StatelessWidget {
//   const MultilanguageApp({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return EasyLocalization(
//       child: const ProviderPage(),
//       supportedLocales: LocalizationManager.instance.supportedLocales,
//       path: LocalizationManager.instance.localePath!,
//       saveLocale: true,
//       startLocale: LocalizationEnum.ENGLISH.translate,
//       fallbackLocale: LocalizationEnum.ENGLISH.translate,
//       assetLoader: const CodegenLoader(),
//     );
//   }
// }

// class ProviderPage extends StatelessWidget {
//   const ProviderPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       localizationsDelegates: context.localizationDelegates,
//       supportedLocales: context.supportedLocales,
//       locale: context.locale,
//       title: 'Material App',
//       theme: context.theme,
//     );
//   }
// }
