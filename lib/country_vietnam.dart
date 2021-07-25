import 'package:covid/myhomepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'model/country.dart';

class CountryVietNam extends StatefulWidget {
  final MyCounrty mycountry;

  CountryVietNam({Key? key, required this.mycountry}) : super(key: key);

  @override
  _CountryVietNamState createState() => _CountryVietNamState();
}

class _CountryVietNamState extends State<CountryVietNam> {
  List<Color> listcolor = [
    // Colors.black54,
    Colors.blueAccent,
    Colors.green,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();

    Map<String, double> data = {
      "Đang Điều Trị": widget.mycountry.active.toDouble(),
      "Đã Khỏi Bệnh": widget.mycountry.recovered.toDouble(),
      "Số Người Chết": widget.mycountry.deaths.toDouble()
    };
    int key = 0;
    return RefreshIndicator(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, int) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 52),
                child: Image.asset(
                  'assets/images/1024px-Logo_Bộ_Y_tế.svg.png',
                  width: 120.0,
                  height: 120.0,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                child: Text(
                  "Bạn đã cập nhật lúc:\n${DateFormat.yMMMMd().add_Hms().format(dateTime)}",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color(0xffFF042F50)),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Container(
                child: Text(
                  'Tổng số ca mắc: ${widget.mycountry.confirmed}',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFF042F50)),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              PieChart(
                centerText: "${widget.mycountry.countryRegion}",
                // key: ValueKey(key),
                dataMap: data,
                colorList: listcolor,
                chartLegendSpacing: 25,
              ),
              Container(
                  width: 230,
                  height: 40,
                  margin: EdgeInsets.only(top: 32),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.red,
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          'assets/images/1200px-Flag_of_Vietnam.svg.png',
                          width: 60,
                          //height: 120.0,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      Padding(padding: EdgeInsets.only(right: 12)),
                      Text(
                        "Việt Nam",
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFF042F50)),
                      )
                    ],
                  )),
            ],
          );
        },
      ),
      onRefresh: () {
        return Future.delayed(Duration(seconds: 1), () {
          setState(() {
            MyHomePage();
          });
        });
      },
    );
  }
}
