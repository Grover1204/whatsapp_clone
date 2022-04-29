// import 'package:app_clone/whatsappclone/colors.dart';
// import 'package:app_clone/whatsappclone/responsive/responsive.dart';
// import 'package:app_clone/whatsappclone/screens/mobile_screen_layout.dart';
// import 'package:app_clone/whatsappclone/screens/web_screen_layout.dart';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'whatsapp clone',
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: backgroundColor,
//       ),
//       home: const ResponsiveLayout(
//         mobileScreenLayout: MobileScreenLayout(),
//         webScreenLayout: WebScreenLayout(),
//       ),
//     );
//   }
// }
import 'package:app_clone/whatsapp2/clone_color.dart';
import 'package:app_clone/whatsapp2/responsive/mb_screen.dart';
import 'package:app_clone/whatsapp2/responsive/res_screen.dart';
import 'package:app_clone/whatsapp2/responsive/wb_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const ResScreen(mbscreen: MbScreen(), wbscreen: WbScreen()),
    );
  }
}
