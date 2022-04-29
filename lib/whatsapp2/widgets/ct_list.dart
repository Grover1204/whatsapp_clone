import 'package:app_clone/main.dart';
import 'package:app_clone/whatsapp2/clone_color.dart';
import 'package:app_clone/whatsapp2/clone_info.dart';
import 'package:app_clone/whatsapp2/global.dart';
import 'package:app_clone/whatsapp2/responsive/mb_chat.dart';
import 'package:app_clone/whatsapp2/responsive/mb_screen.dart';
import 'package:app_clone/whatsapp2/responsive/res_screen.dart';
import 'package:app_clone/whatsapp2/responsive/wb_screen.dart';
import 'package:flutter/material.dart';

class Ctlist extends StatefulWidget {
  const Ctlist({Key? key}) : super(key: key);

  @override
  State<Ctlist> createState() => _CtlistState();
}

class _CtlistState extends State<Ctlist> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: clone_info.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MobileChatScreen(),
                      ),
                    );
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0, top: 5),
                  child: ListTile(
                    title: Text(
                      clone_info[index]['name'].toString(),
                      style: const TextStyle(
                        // color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        clone_info[index]['message'].toString(),
                        style: const TextStyle(
                            // color: Colors.grey,
                            fontSize: 15),
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        clone_info[index]['profilePic'].toString(),
                      ),
                    ),
                    trailing: Text(
                      clone_info[index]['time'].toString(),
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                indent: 85,
                color: dividerColor,
              )
            ],
          );
        },
      ),
    );
  }
}
