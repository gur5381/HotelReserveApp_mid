import 'package:flutter/material.dart';
import 'package:mid_term/home.dart';
import 'package:mid_term/model/hotel.dart';
import 'package:mid_term/model/hotels_repository.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mid_term/localization/app_translations_delegate.dart';
import 'package:mid_term/localization/app_translations.dart';
import 'package:mid_term/localization/application.dart';



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppTranslationsDelegate _newLocaleDelegate;

  List<Hotel> products = HotelsRepository.loadProducts(Kind.all);

  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    application.onLocaleChanged = onLocaleChange;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "midterm",
      home: HomePage(theme: _hotelTheme, title: "yolo", products: products),
      localizationsDelegates: [
        _newLocaleDelegate,
        const AppTranslationsDelegate(),
        //provides localised strings
        GlobalMaterialLocalizations.delegate,
        //provides RTL support
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: application.supportedLocales(),
    );
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }
}


final ThemeData _hotelTheme = _buildHotelTheme();

ThemeData _buildHotelTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: Colors.blueAccent,
    primaryColor: Colors.blue,
    buttonColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    textSelectionColor: Colors.black,
    errorColor: Colors.red,
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.accent,
    ),
    primaryIconTheme: base.iconTheme.copyWith(
        color: Colors.white
    ),
    accentIconTheme: base.iconTheme.copyWith(
        color: Colors.lightBlue
    ),


    textTheme: _buildHotelTextTheme(base.textTheme),
    primaryTextTheme: _buildHotelTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildHotelTextTheme(base.accentTextTheme),
  );
}

TextTheme _buildHotelTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(
        fontSize: 20.0,
        color: Colors.white,
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    body1: base.body1.copyWith(
      fontWeight: FontWeight.w900,
      fontSize: 13.0,
    ),
    body2: base.body2.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 10.0,
    ),
    button: base.button.copyWith(
      fontWeight: FontWeight.w500,
      color: Colors.lightBlue,
      fontSize: 12.0,

    )
  ).apply(
    fontFamily: 'Rubik',

  );
}

