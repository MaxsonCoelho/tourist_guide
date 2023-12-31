import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';

class HomePage extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue'
  );

  HomePage({super.key});

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
          title: 'Página Home',
          hideSearch: false,
          showBack: false
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: Text('Bem vindo(a) ao', style: styles,),
              ),

              Image.asset('lib/assets/travel_logo.png',
                width: 200,
              ),

              Container(
                margin: const EdgeInsets.only(top: 30),
                child: Text('Seu guia de viagem perfeito', style: styles,),
              ),
            ],
          )
        ),
      )
    );
  }
}