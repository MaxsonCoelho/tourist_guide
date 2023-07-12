// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_guide/src/partials/citybox.dart';

import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';

class ListCityPage extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void cityBoxAction(cityData) {
    print( cityData['name'] );
  }


  ListCityPage({super.key});

  @override
  Widget build(BuildContext context) {

    final int continentIndex = ModalRoute.of(context)?.settings.arguments as int;

    //consumindo dados do model appdata
    return Consumer<AppData>(
      builder: (contexto, appdata, child) {
        var cities = [];
        for(var country in appdata.data[continentIndex]['countries']) {
          cities.addAll(country['cities']);
        }

        return Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(
          pageContext: context
          ),
          appBar: CustomAppBar(
            scaffoldKey: _scaffoldKey,
            pageContext: context,
            title: '${appdata.data[continentIndex]['name']} (${cities.length} cidades)',
            hideSearch: false,
            showBack: true
          ),
          backgroundColor: Colors.white,
          body: GridView.count(
            crossAxisCount: 3,
            children: List.generate(cities.length, (index) {
              return CityBox(
                data: cities[index], 
                onTap: cityBoxAction
              );
            }),
          ),
        );
      }
    );
  }
}



