import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Res extends StatefulWidget {
  const Res({Key? key}) : super(key: key);

  @override
  State<Res> createState() => _ResState();
}

class _ResState extends State<Res> {
  int angka = 1;
  var Hold = '';

  des() {
    if (angka != 1) {
      setState(() {
        angka--;
      });
    }
  }

  inc() {
    setState(() {
      angka++;
    });
  }

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
                  // margin: EdgeInsets.only(top: 100, bottom: 100),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('dd/MM/yyyy').format(DateTime.now()),
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        DateFormat('hh:mm:ss').format(DateTime.now()),
                        style: TextStyle(
                            fontSize: 10 + double.parse(angka.toString())),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              // ignore: deprecated_member_use
                              children: [
                                RaisedButton(
                                  onPressed: () => des(),
                                  child: const Icon(Icons.remove),
                                ),
                                RaisedButton(
                                  onPressed: () => setState(() {
                                    Hold = DateFormat('dd/MM/yyyy hh:mm:ss')
                                        .format(DateTime.now());
                                  }),
                                  child: Text('Get All'),
                                ),
                                RaisedButton(
                                  onPressed: () => inc(),
                                  child: Icon(Icons.add),
                                ),
                              ])
                        ],
                      ),
                      Text(
                        Hold,
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
