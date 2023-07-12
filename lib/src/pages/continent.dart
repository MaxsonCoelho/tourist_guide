// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';
import '../partials/citybox.dart';

class ContinentPage extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue'
  );

  void seeCityAction ( context, int continentIndex ) {
    Navigator.pushNamed(context, '/listcity', arguments: continentIndex);
  }

  void cityBoxAction () {
    
  }

  ContinentPage({super.key});

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
          title: 'Escolha um Continente',
          hideSearch: false,
          showBack: false
        ),
        backgroundColor: Colors.white,
        //listagem de títulos
        body: ListView.builder(
          itemCount: appdata.data.length,
          itemBuilder: (context, index) {
            //criando array de cidades
            var cities = [];
            for(var country in appdata.data[index]['countries']) {
              cities.addAll(country['cities']);
            }

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: Text(
                        '${appdata.data[index]['name']} (${cities.length})',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Heilvetica Neue'
                        ),
                      )
                    ),
                    TextButton(
                      onPressed: () {
                        seeCityAction( context, index );
                      }, 
                      child: const Text(
                        'Ver todas as cidades',
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Heilvetica Neue'
                        ),
                        )
                    ),
                  ],
                ),
                Container(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cities.length,
                    itemBuilder: (BuildContext cityContext, int cityIndex) {
                      return CityBox(
                        data: cities[cityIndex],
                        onTap: cityBoxAction
                      );
                    },
                  ),
                ),
              ],
            );
          },
        )
      )
    );
  }
}



