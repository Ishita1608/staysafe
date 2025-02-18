import 'package:covd19/ui/colors.dart';
import 'package:covd19/ui/LandingScreen.dart';
import 'package:covd19/ui/worldlist.dart';
import 'package:flutter/material.dart';
import 'new/bharat.dart';
import 'service/service_locator.dart';
import 'ui/globalStats.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:covd19/ui/indiascreen.dart';
import 'package:line_icons/line_icons.dart';
import 'ui/statewidescreen.dart';
import 'package:covd19/new/bharat.dart';

void main() {
  setupLocator();

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white, fontFamily: 'Staatliches'),
      home: StartScreen()));
}

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Welcome(),
    Overview(),
    Worldlist(),
    India(),
 //   StateScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.cyan, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.cyan.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
            child: GNav(
                gap: 3,
                activeColor: Colors.cyan,
                color: Colors.white,
                iconSize: 23,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Colors.white,
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.bar_chart,
                    text: 'Stats',
                  ),
                  GButton(
                    icon: LineIcons.globe,
                    text: 'Global',
                  ),
                  GButton(
                    icon: LineIcons.rocket,
                    text: 'India',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
