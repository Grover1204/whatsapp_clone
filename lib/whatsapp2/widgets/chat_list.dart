import 'package:app_clone/whatsapp2/clone_info.dart';
import 'package:app_clone/whatsapp2/widgets/message_card.dart';
import 'package:app_clone/whatsapp2/widgets/sender_message.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: ((context, index) {
        if (messages[index]['isMe'] == true) {
          return MyMessageCard(
            message: messages[index]['text'].toString(),
            date: messages[index]['time'].toString(),
          );
        }
        return SenderMessageCard(
          mes: messages[index]['text'].toString(),
          time: messages[index]['time'].toString(),
        );
      }),
    );
  }
}
