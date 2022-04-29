import 'package:app_clone/whatsapp2/clone_color.dart';
import 'package:flutter/material.dart';

class WebSearch extends StatelessWidget {
  const WebSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.3,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(color: dividerColor),
      )),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: searchBarColor,
            prefixIcon: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.search,
                size: 20,
              ),
            ), // Padding
            hintStyle: const TextStyle(fontSize: 14),
            hintText: 'Search or start new chat',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            contentPadding: const EdgeInsets.all(10)),
      ),
    );
  }
}
