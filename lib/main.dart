import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:dynamic_theming/home.dart';
import 'package:dynamic_theming/theme/theme_collection.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ThemeData.dark();
    final darkButtonTheme =
        dark.buttonTheme.copyWith(buttonColor: Colors.grey[700]);
    final darkFABTheme = dark.floatingActionButtonTheme;

    final themeCollection = ThemeCollection(
      themes: {
        AppThemes.LightBlue : ThemeData(primarySwatch:  Colors.blue),
        AppThemes.LightRed : ThemeData(primarySwatch:  Colors.red),
        AppThemes.DarkBlue : dark.copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue),
          buttonTheme: darkButtonTheme,
          floatingActionButtonTheme: darkFABTheme.copyWith(
            backgroundColor: Colors.blue
          )
        ),
        AppThemes.DarkRed: ThemeData.from(
          colorScheme: const ColorScheme.dark(
            primary: Colors.red,
            secondary: Colors.red
          )),
      }
    );

    return DynamicTheme(
        themeCollection: themeCollection,
        defaultThemeId: AppThemes.LightBlue,
        builder: ((context, theme) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: theme,
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        }));
  }
}
