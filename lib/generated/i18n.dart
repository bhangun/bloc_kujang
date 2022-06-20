
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

//This file is automatically generated. DO NOT EDIT, all your changes would be lost.

class S implements WidgetsLocalizations {
  const S();

  static const GeneratedLocalizationsDelegate delegate =
      const GeneratedLocalizationsDelegate();

  static S? of(BuildContext context) =>
      Localizations.of<S>(context, WidgetsLocalizations);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  String get add => "Add";
  String get data_empty => "Data Empty";
  String get delete => "Delete";
  String get email => "Email";
  String get forgot_password => "Forgot Password";
  String get home => "Home";
  String get password => "Password";
  String get please_fill_field => "Please fill in the field";
  String get share => "Share";
  String get sign_in => "Sign In";
  String get user_password => "Password";
}

class en extends S {
  const en();
}

class id extends S {
  const id();

   @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get add => "Tambah";
  @override
  String get user_password => "Sandi";
  @override
  String get password => "Sandi";
  @override
  String get please_fill_field => "Silahkan isi kolom";
  @override
  String get data_empty => "Data Kosong";
  @override
  String get share => "Sebar";
  @override
  String get delete => "Hapus";
  @override
  String get email => "Email";
  @override
  String get home => "Beranda";
  @override
  String get sign_in => "Masuk";
  @override
  String get forgot_password => "Lupa Sandi";
}


class GeneratedLocalizationsDelegate extends LocalizationsDelegate<WidgetsLocalizations> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[

      const Locale("en", ""),
      const Locale("id", ""),

    ];
  }

  LocaleResolutionCallback? resolution({Locale? fallback}) {
    return (Locale? locale, Iterable<Locale> supported) {
      final Locale languageLocale = new Locale(locale!.languageCode, "");
      if (supported.contains(locale))
        return locale;
      else if (supported.contains(languageLocale))
        return languageLocale;
      else {
        final Locale fallbackLocale = fallback ?? supported.first;
        return fallbackLocale;
      }
    };
  }

  @override
  Future<WidgetsLocalizations> load(Locale locale) {
    final String lang = getLang(locale);
    switch (lang) {

      case "en":
        return new SynchronousFuture<WidgetsLocalizations>(const en());
      case "id":
        return new SynchronousFuture<WidgetsLocalizations>(const id());

      default:
        return new SynchronousFuture<WidgetsLocalizations>(const S());
    }
  }

  @override
  bool isSupported(Locale locale) => supportedLocales.contains(locale);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;
}

String getLang(Locale l) => l.countryCode != null && l.countryCode!.isEmpty
    ? l.languageCode
    : l.toString();
