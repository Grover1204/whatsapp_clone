import 'package:app_clone/whatsapp2/clone_color.dart';
import 'package:flutter/material.dart';

class WebProfile extends StatelessWidget {
  const WebProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.077,
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: const BoxDecoration(
          color: webAppBarColor,
          border: Border(right: BorderSide(color: dividerColor))),
      child: Row(
        children: [
          const CircleAvatar(),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.comment),
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
