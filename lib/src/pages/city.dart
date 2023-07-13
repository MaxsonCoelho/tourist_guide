import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';

class CityPage extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue'
  );

  CityPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> cityData = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    print(cityData);

    return Consumer<AppData>(
      builder: (contexto, appdata, child) => Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(
          pageContext: context
        ),
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          title: 'Tela cidade',
          hideSearch: true,
          showBack: false
        ),
        backgroundColor: Colors.white,
        body: const Center(
          child: Text('....'),
          )
        ),
      );
  }
}