import 'dart:convert';
import 'package:apinotshowing2/model/apimodelsample.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homescreencontroller with ChangeNotifier {
  SampleApiResmodel? resmodel;
  fetchData() async {
    final url = Uri.parse("https://api.publicapis.org/entries");
    var response = await http.get(url);
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);

      // print(decodeData["count"]);

      resmodel = SampleApiResmodel.fromJson(decodeData);
      print(resmodel?.entries?.first.api);
      notifyListeners();
    } else {
      print("api failed");
    }
  }
}
