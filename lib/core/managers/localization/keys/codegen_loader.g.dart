// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> es_ES = {
  "hello": "Hola",
  "goodbye": "adiós",
  "how_are_you": "cómo estás",
  "what_is_your_name": "cuál es tu nombre"
};
static const Map<String,dynamic> tr_TR = {
  "hello": "merhaba",
  "goodbye": "güle güle",
  "how_are_you": "nasılsın",
  "what_is_your_name": "adın nedir"
};
static const Map<String,dynamic> fr_FR = {
  "hello": "salut",
  "goodbye": "au revoir",
  "how_are_you": "Comment ça va",
  "what_is_your_name": "quel est ton nom"
};
static const Map<String,dynamic> en_US = {
  "hello": "Hi",
  "goodbye": "bye",
  "how_are_you": "how are you",
  "what_is_your_name": "what is your name"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"es_ES": es_ES, "tr_TR": tr_TR, "fr_FR": fr_FR, "en_US": en_US};
}
