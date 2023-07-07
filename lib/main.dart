import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/models/appdata.dart';

import 'src/pages/home.dart';
import 'src/pages/preload.dart';
import 'src/pages/search.dart';
import 'src/pages/continent.dart';

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
        '/search':(context) => SearchPage(),
        '/continent': (context) => ContinentPage()
      },
      initialRoute: '/preload',
    );
  }
}