import 'package:covid/content.dart';
import 'package:covid/country_vietnam.dart';
import 'package:covid/myhomepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  List<Widget> item = <Widget>[
    MyHomePage(),
    Content(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Covid-19"),
        ),
        body: item[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            iconSize: 25,
            items: const <BottomNavigationBarItem>[
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.home),
              //   label: 'Trang Chủ',
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart),
                label: 'Thống Kê',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.content_paste_sharp), label: 'Tin Tức')
            ],
            currentIndex: _selectedIndex,
            onTap: (value) {
              setState(() {
                _selectedIndex = value;
              });
            }),
      ),
    );
  }
}
