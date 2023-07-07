import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';

class SearchPage extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue'
  );

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    //consumindo dados do model appdata
    return Consumer<AppData>(
      builder: (contexto, appdata, child) => Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(
          pageContext: context
        ),
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          title: 'Busque uma cidade',
          hideSearch: true,
          showBack: false
        ),
        backgroundColor: Colors.white,
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('buscar...')
            ],
          )
        ),
      )
    );
  }
}