import 'package:flutter/material.dart';

class ResScreen extends StatelessWidget {
  final Widget mbscreen;
  final Widget wbscreen;
  const ResScreen({Key? key, required this.mbscreen, required this.wbscreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return wbscreen;
        }
        return mbscreen;
      },
    );
  }
}
