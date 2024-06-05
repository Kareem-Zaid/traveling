/*
// ignore_for_file: avoid_print

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:traveling/favorites_screen.dart';
import 'package:traveling/filters_screen.dart';
import 'package:traveling/tabs_screen.dart';
import 'package:traveling/trip_details_screen.dart';
import 'package:traveling/trips_screen.dart';
import '../app_data.dart';
import '../models.dart';
// import 'categories_screen.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Trip> availableTrips = tripsData;
  void changeFilters(Map<String, bool> selectedFilters) {
    setState(() {
      availableTrips = tripsData.where((trip) {
        if (trip.isInSummer != true && selectedFilters['summer'] == true) {
          return false;
        }
        if (trip.isInWinter != true && selectedFilters['winter'] == true) {
          return false;
        }
        if (trip.isForFamilies != true && selectedFilters['families'] == true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

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
      initialRoute: '/',
      routes: {
        // Now this goes as the router for the page, instead of of "MaterialPageRoute" method
        '/': (context) => const TabsScreen(),
        TripsScreen.route: (context) =>
            TripsScreen(availableTrips: availableTrips),
        TripDetailsScreen.route: (context) => const TripDetailsScreen(),
        FavouritesScreen.route: (context) => const FavouritesScreen(),
        FiltersScreen.route: (context) =>
            FiltersScreen(applyFilter: changeFilters),
      },
      // darkTheme: ThemeData.dark(),
      // Check why fontFamily & appBar color don't apply on dark theme
    );
  }
}
*/