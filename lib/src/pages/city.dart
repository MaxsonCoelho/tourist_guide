import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/appdata.dart';
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

    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Consumer<AppData>(
      builder: (contexto, appdata, child) => Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(
          pageContext: context
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: 250,
              decoration: const BoxDecoration(
                color: Colors.red
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(top: statusBarHeight),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: (){},
                ),
            )
          ],
        )
        ),
      );
  }
}