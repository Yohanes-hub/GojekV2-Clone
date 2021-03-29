

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'home_page.dart';

class TabPage extends StatefulWidget
{
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Center(child: Image.asset("assets/img/promo.jpg")),
   HomePage(),
    Center(child: Image.asset("assets/img/chatt.png")),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Color(0xff1cad43),
                  boxShadow: [
                    BoxShadow(blurRadius: 20,color: Colors.black.withOpacity(1))
                  ]),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 8),
                  child: GNav(
                      duration: Duration(milliseconds: 900),
                      gap: 8,
                      color: Colors.white,
                      activeColor: Colors.white,
                      iconSize: 24,
                      tabBackgroundColor: Colors.white24,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      tabs: [
                        GButton(
                          icon: Icons.calculate_outlined,
                          text: 'Promos',
                        ),
                        GButton(
                          icon: Icons.home_filled,
                          text: 'Home',
                        ),
                        GButton(
                          icon: Icons.message_rounded,
                          text: 'Chat',
                        ),
                      ],
                    selectedIndex: _selectedIndex,
                    onTabChange: (index){
                        setState(() {
                          _selectedIndex = index;
                        });
                    },
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height /1.15,
              child: _widgetOptions.elementAt(_selectedIndex),
            )
          ],
        ),
      ),

    );
  }
}

