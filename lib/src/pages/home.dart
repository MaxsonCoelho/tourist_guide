import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/appdata.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //consumindo dados do model appdata
    return Consumer<AppData>(
      builder: (contexto, appdata, child) => Scaffold(
        appBar: AppBar(
        title: const Text('Home'),
        ),
        body: const Center(
        child: Text('123456....'),
        ),
      )
    );
  }
}