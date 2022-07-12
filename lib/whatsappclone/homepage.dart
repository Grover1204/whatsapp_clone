import 'package:demoapp/screens/info.dart';
import 'package:flutter/material.dart';

import '../tab_screens/home_tab.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    Text('settings'),
    Text('boring'),
    Text('test')
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropDownValue = 'Members';

  int _tabIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage._widgetOptions.elementAt(_tabIndex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 100,
        iconSize: 35,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orangeAccent,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: (_tabIndex == 0) ? 'Home' : '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
            ),
            label: 'text',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: (_tabIndex == 3) ? 'Home' : '',
          ),
        ],
        currentIndex: _tabIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}


//  Align(
//             alignment: Alignment.center,
//             child: Text(
//               'IESoft Technologies',
//               style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Align(
//             child: InkWell(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => InfoScreen(),
//                   ),
//                 );
//               },
//               child: Container(
//                   padding: EdgeInsets.all(15),
//                   decoration: BoxDecoration(
//                       color: Color.fromARGB(255, 172, 246, 175),
//                       borderRadius: BorderRadius.circular(30)),
//                   child: Text(
//                     'Get Started',
//                     style: TextStyle(fontSize: 24),
//                   )),
//             ),
//           )