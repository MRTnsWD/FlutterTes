import 'dart:html';

import 'package:flutter/material.dart';

class Res extends StatefulWidget {
  const Res({Key? key}) : super(key: key);

  @override
  State<Res> createState() => _ResState();
}

class _ResState extends State<Res> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
        body: Center(
          child: Text('hallo'),
        ),
      );
  }
}
