import 'package:covid/model/country.dart';
import 'package:covid/service/mycountry_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'country_vietnam.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<MyCounrty> futurecountry;

  @override
  void initState() {
    super.initState();
    futurecountry = getcountryapi();
  }

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<MyCounrty>(
          future: futurecountry,
          builder: (context, int) {
            if (int.hasData) {
              return CountryVietNam(mycountry: int.data!);
            } else if (int.hasError) {
              return Text("${int.error}");
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );
  }
}
