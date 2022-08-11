import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:untitled/new.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
          ),
      home: const Scaffold(
        body: Center(
          child: Home(
              ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color Warna = Colors.black;

  projetCard(lang, title, description) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Card(
        // shadowColor: Colors.blueAccent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: InkWell(
          child: Container(
            margin: EdgeInsets.only(left: 20, top: 30, right: 10),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lang,
                  style: TextStyle(
                    color: Warna,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  title,
                  style: TextStyle(
                      color: Warna,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  description,
                  style: TextStyle(color: Colors.black45, fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Res(),)),
        ),
        color: Color.fromARGB(255, 245, 245, 245),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text('Simple Example'),
      // ),
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 16,
        snapSpec: const SnapSpec(
          // Enable snapping. This is true by default.
          snap: true,
          // Set custom snapping points.
          snappings: [0.3, 0.7, 1.0],
          // Define to what the snappings relate to. In this case,
          // the total available space that the sheet can expand to.
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        // The body widget will be displayed under the SlidingSheet
        // and a parallax effect can be applied to it.
        body: Container(
            // alignment: Alignment.center,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 200),
                    // height: 1000,
                    // width: 1000,
                    // margin: EdgeInsets.only(top: 20),
                    child: ShaderMask(
                      shaderCallback: (rect) {
                        return LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [Warna, Colors.transparent],
                        ).createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height));
                      },
                      blendMode: BlendMode.dstIn,
                      child: Image.network(
                        'https://avatars.mds.yandex.net/i?id=7952d32ee6c19fd93bbdced969ca79bb-5232373-images-thumbs&n=13',
                        height: 1000,
                        fit: BoxFit.cover,
                      ),
                    ))
              ],
            )),
        builder: (context, state) {
          // This is the content of the sheet that will get
          // scrolled, if the content is bigger than the available
          // height of the sheet.
          return Container(
            height: 500,
            color: Warna,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  projetCard('Hai', 'PUSH', 'push me for other promos'),
                  projetCard('z', 'z', 'z')
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}