import 'package:app_clone/whatsapp2/clone_color.dart';
import 'package:flutter/material.dart';

class SenderMessageCard extends StatelessWidget {
  final String mes;
  final String time;
  const SenderMessageCard({Key? key, required this.mes, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 45,
          ),
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: senderMessageColor,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    bottom: 20,
                    right: 30,
                    top: 5,
                  ),
                  child: Text(
                    mes,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Positioned(
                    bottom: 2,
                    right: 10,
                    child: Row(
                      children: [
                        Text(
                          time,
                          style: const TextStyle(
                              fontSize: 13, color: Colors.white60),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.done_all,
                          size: 20,
                          color: Colors.white60,
                        )
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
