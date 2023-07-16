import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppData with ChangeNotifier {
  var data = [];
  var favorites = [];

  Future<List> searchCity(text) async {
    var result = [];
    
    text = text.trim().toLowerCase();
    if(text == '') {
      return result;
    }

    for(var continents in data) {
      for(var country in continents['countries']) {
        for(var city in country['cities']) {
          if(city['name'].toLowerCase().contains(text)) {
            result.add(city);
          }
        }
      }
    }

    return result;
  }

  bool hasFavorite(cityName) {
    return favorites.contains(cityName);
  }

  bool favorite(cityName) {
    if(hasFavorite(cityName)) {
      favorites.remove(cityName);
      return false;
    }else {
      favorites.add(cityName);
      return true;
    }
  }

  void setData(newData) {
    data = newData;
    notifyListeners();
  }

  Future<bool> requestData() async {
    final res = await http.get(Uri.parse('https://api.b7web.com.br/flutter1wb/'));

    if(res.statusCode == 200) {
      print(res.body);
      setData( jsonDecode(res.body) );
      return true;
    } else {
      return false;
    }
  }
}