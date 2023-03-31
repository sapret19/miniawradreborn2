import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:miniawradreborn2/home/home_screen.dart';
import 'package:miniawradreborn2/sizecoba.dart';
import 'package:sizer/sizer.dart';

class navbar extends StatefulWidget {
  const navbar({super.key});

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  int _yangdipilih = 0;

  static List<Widget> _widgetOption = <Widget>[Home(), ScreenSize()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOption.elementAt(_yangdipilih),
      bottomNavigationBar: Container(
        // color: Colors.white,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              offset: Offset(0, 0),
              color: Color.fromARGB(117, 85, 84, 84),
              blurRadius: 1,
              spreadRadius: 1)
        ]),
        // height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 9),
          child: GNav(
            rippleColor: Colors.lightBlue,
            hoverColor: Colors.black,
            activeColor: Colors.black,
            tabBackgroundColor: Color.fromARGB(43, 158, 158, 158),
            // tabActiveBorder: Colors.red,
            iconSize: 30,
            padding: EdgeInsets.all(10),
            color: Color.fromARGB(167, 97, 97, 97),
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            gap: 1,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Beranda",
              ),
              GButton(
                icon: Icons.info,
                text: "Tentang",
              ),
            ],
            selectedIndex: _yangdipilih,
            onTabChange: (index) {
              setState(() {
                _yangdipilih = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
