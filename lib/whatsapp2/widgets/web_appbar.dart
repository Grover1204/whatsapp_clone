import 'package:app_clone/whatsapp2/clone_color.dart';
import 'package:app_clone/whatsapp2/clone_info.dart';
import 'package:app_clone/whatsapp2/global.dart';
import 'package:flutter/material.dart';

class WebAppBar extends StatefulWidget {
  const WebAppBar({Key? key}) : super(key: key);

  @override
  State<WebAppBar> createState() => _WebAppBarState();
}

class _WebAppBarState extends State<WebAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.077,
      width: MediaQuery.of(context).size.width * 0.7,
      color: webAppBarColor,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
          ),
          const SizedBox(width: 5),
          Text(
            clone_info[chat_index]['name'].toString(),
            style: const TextStyle(fontSize: 18),
          ),
          const Spacer(),
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
      ),
    );
  }
}
