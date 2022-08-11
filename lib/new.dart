import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Res extends StatefulWidget {
  const Res({Key? key}) : super(key: key);

  @override
  State<Res> createState() => _ResState();
}

class _ResState extends State<Res> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: StreamBuilder(
            stream: Stream.periodic(const Duration(seconds: 1)),
            builder: (context, snapshot) {
              return Container(
                margin: EdgeInsets.only(top: 100),
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('dd/MM/yyyy').format(DateTime.now()), style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        DateFormat('hh:mm:ss').format(DateTime.now()),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
