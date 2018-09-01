import 'package:flutter/material.dart';
import 'package:flutter\_localizations/flutter\_localizations.dart';
import 'dart:async';

import './models/menu.dart' show Menu;

import './utils/localization.dart' show Localization, LocalizationDelegate;
import './utils/theme.dart' as Theme;
import './screens/splash.dart' show Splash;
import './screens/index.dart' show Index;

import 'package:flutter_examples/screens/ex_infinite_list.dart' show ExInfiniteList;
import 'package:flutter_examples/screens/ex_carousel.dart' show ExCarousel;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Theme.Colors.dodgerBlue,
        accentColor: Theme.Colors.dodgerBlue,
        hintColor: Theme.Colors.paleGray,
        disabledColor: Theme.Colors.disabled,
      ),
      routes: {
        '/splash': (BuildContext context) => Splash(),
        '/index': (BuildContext context) => Index(initList: [
          Menu('Infinite ListView', Localization.of(context).trans('INFINITE_LIST_DESCRIPTION')),
          Menu('Carousel', Localization.of(context).trans('CAROUSEL_DESCRIPTION')),
        ]),
        '/infinite_list_ex': (BuildContext context) => ExInfiniteList(),
        '/carousel_ex': (BuildContext context) => ExCarousel(),
      },
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('ko', 'KR')
      ],
      localizationsDelegates: [
        const LocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {
        for (Locale supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode || supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      title: 'dooboolab',
      home: Splash(), // production
    );
  }
}

