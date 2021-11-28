import 'dart:convert';

import 'package:covid/model/country.dart';
import 'package:http/http.dart' as http;

Future<MyCounrty> getcountryapi() async {
  final String url =
      "https://covid19.mathdro.id/api/countries/vietnam/confirmed";
  final http.Client client = http.Client();
  final response = await client.get(Uri.parse(url));
  if (response.statusCode == 200) {
    print('object');
    //final reponsedata = jsonDecode(response.body);
    return MyCounrty.fromJson(jsonDecode(response.body)[0]);
  }else{
    throw Exception('Failed to load album');
  }
}
