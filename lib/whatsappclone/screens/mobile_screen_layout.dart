import 'package:app_clone/whatsappclone/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/contact_list.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: appBarColor,
            elevation: 0.0,
            title: const Text(
              'whatsapp',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            centerTitle: false,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: Colors.grey)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert, color: Colors.grey))
            ],
            bottom: const TabBar(
              indicatorColor: tabColor,
              indicatorWeight: 4,
              labelColor: tabColor,
              unselectedLabelColor: Colors.grey,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              tabs: [
                Tab(text: 'Chat'),
                Tab(text: 'Status'),
                Tab(text: 'Calls'),
              ],
            ),
          ),
          body: const ContactList(),
        ));
  }
}
