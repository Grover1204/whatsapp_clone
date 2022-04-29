import 'package:app_clone/whatsappclone/colors.dart';
import 'package:app_clone/whatsappclone/utils.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: info_whatsapp.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          title: Text(
                            info_whatsapp[index]['name'].toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              info_whatsapp[index]['message'].toString(),
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                info_whatsapp[index]['profilePic'].toString()),
                          ),
                          trailing: Text(
                            info_whatsapp[index]['time'].toString(),
                            style: const TextStyle(
                                fontSize: 13, color: Colors.grey),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const Divider(
              // thickness: 10,
              color: dividerColor,
              indent: 85,
            ),
          ],
        ));
  }
}
