import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:traveling/trips_screen.dart';
import 'app_data.dart';
import 'categories_screen.dart';

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
        textTheme: const TextTheme(titleLarge: TextStyle(color: Colors.white)),
        appBarTheme:
            AppBarTheme(color: Theme.of(context).colorScheme.inversePrimary),
      ),
      home: const CategoriesScreen(),
      routes: {
        TripsScreen.route: (context) => const TripsScreen(tripsData),
        // Now this goes as the router for the page, instead of of "MaterialPageRoute" method
      },
      // darkTheme: ThemeData.dark(),
      // Check why fontFamily & appBar color don't apply on dark theme
    );
  }
}
