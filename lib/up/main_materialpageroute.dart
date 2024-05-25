import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('ar')],
      locale: const Locale('ar'),
      title: 'Traveling Guide',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        fontFamily: 'Cairo',
        textTheme: const TextTheme(
            titleLarge: TextStyle(
          color: Colors.white, /*fontWeight: FontWeight.bold*/
        )),
        appBarTheme:
            AppBarTheme(color: Theme.of(context).colorScheme.inversePrimary),
      ),
      home: const CategoriesScreen(),
      // darkTheme: ThemeData.dark(),
      // Check why font family (& maybe app bar color) doesn't apply on dark theme
    );
  }
}
