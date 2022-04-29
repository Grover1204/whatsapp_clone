import 'package:app_clone/whatsappclone/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/ct_list.dart';

class MbScreen extends StatelessWidget {
  const MbScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          title: const Text(
            'Whatsapp',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              color: Colors.grey,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
              color: Colors.grey,
            )
          ],
          bottom: const TabBar(
              indicatorColor: tabColor,
              indicatorWeight: 4,
              unselectedLabelColor: Colors.grey,
              labelColor: tabColor,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              tabs: [
                Tab(child: Text('CHAT')),
                Tab(child: Text('STATUS')),
                Tab(child: Text('CALLS'))
              ]),
        ),
        body: const Ctlist(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.comment,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
