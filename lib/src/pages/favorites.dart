import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';
import '../partials/citybox.dart';

class FavoritesPage extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue'
  );

  FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    //consumindo dados do model appdata
    return Consumer<AppData>(
      builder: (contexto, appdata, child) {

        List favorites = appdata.favoritesCities();

        return Scaffold(
          key: _scaffoldKey,
          drawer: CustomDrawer(
            pageContext: context
          ),
          appBar: CustomAppBar(
            scaffoldKey: _scaffoldKey,
            pageContext: context,
            title: 'Cidades Favoritas',
            hideSearch: false,
            showBack: false
          ),
          backgroundColor: Colors.white,
          body: GridView.count(
                crossAxisCount: 2,
                children: List.generate(favorites.length, (index) {
                  return CityBox(
                    data: favorites[index], 
                    onTap: (cityData) {
                      Navigator.pushNamed(context, '/city', arguments: cityData);
                    },
                  );
                }),
              )
        );
      }
    );
  }
}