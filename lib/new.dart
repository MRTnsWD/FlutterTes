import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Res extends StatefulWidget {
  const Res({Key? key}) : super(key: key);

  @override
  State<Res> createState() => _ResState();
}

class _ResState extends State<Res> {
  int angka = 1;
  var Date = DateFormat('dd/MM/yyyy').format(DateTime.now()),
      Time = DateFormat('hh:mm:ss').format(DateTime.now());

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  des() {
    if (angka != 1) {
      setState(() {
        angka--;
      });
    }
    print(angka);
  }

  inc() {
    setState(() {
      angka++;
      print(angka);
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
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        Date,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        Time,
                        style: TextStyle(
                            fontSize: 10 + double.parse(angka.toString())),
                      ),
                      Column(children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // ignore: deprecated_member_use
                            children: [
                              RaisedButton(
                                onPressed: () => des(),
                                child: const Icon(Icons.add),
                              ),
                              RaisedButton(
                                onPressed: () => inc(),
                                child: Icon(Icons.add),
                              ),
                            ])
                      ])
                    ],
                  ),
                ),
              );
            }));
  }
}
