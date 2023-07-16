import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppData with ChangeNotifier {
  var data = [];
  var favorites = [];

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