import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/models/appdata.dart';

import 'src/pages/home.dart';
import 'src/pages/preload.dart';
import 'src/pages/search.dart';
import 'src/pages/continent.dart';
import 'src/pages/listcity.dart';
import 'src/pages/city.dart';
import 'src/pages/favorites.dart';

void main() => runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppData()
          )
    ],
    child: const MyApp(),
    )
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/preload':(context) => const PreloadPage(),
        '/home':(context) => HomePage(),
        '/search':(context) => const SearchPage(),
        '/continent': (context) => ContinentPage(),
        '/listcity':(context) => ListCityPage(),
        '/city':(context) => CityPage(),
        '/favorites':(context) => FavoritesPage()
      },
      initialRoute: '/preload',
    );
  }
}