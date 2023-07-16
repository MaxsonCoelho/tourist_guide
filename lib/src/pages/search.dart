import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';
import '../partials/citybox.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPage();
}
class _SearchPage extends State<SearchPage> {
  var list = [];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void doSearch(pageContext, text) async {
    // ignore: await_only_futures
    var newList = await Provider.of<AppData>(pageContext, listen:false).searchCity(text);
    
    setState(() {
      list = newList;
    });
  }

  TextStyle styles = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue'
  );

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
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child:  TextField(
                onChanged: (text) {
                  doSearch(context, text);
                },
                decoration: const InputDecoration(
                  hintText: 'Digite o nome de uma cidade',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search, size: 32)
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(list.length, (index) {
                  return CityBox(
                    data: list[index], 
                    onTap: (cityData) {
                      Navigator.pushNamed(context, '/city', arguments: cityData);
                    },
                  );
                }),
              ) 
            )
          ],
        )
      )
    );
  }
}