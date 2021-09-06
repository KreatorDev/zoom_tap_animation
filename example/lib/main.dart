import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const title = 'Zoom Tap Animation Example';
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 4; i > 1; i--)
              ZoomTapAnimation(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 30.0),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: FlutterLogo(
                      size: 40.0 * i,
                    ),
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Tap Event',
                        textAlign: TextAlign.center,
                      ),
                      duration: Duration(
                        milliseconds: 100,
                      ),
                    ));
                  },
                  begin: 1.0,
                  end: 0.9,
                  beginDuration: const Duration(milliseconds: 20),
                  endDuration: const Duration(milliseconds: 120),
                  beginCurve: Curves.decelerate,
                  endCurve: Curves.fastOutSlowIn),
          ],
        ),
      ),
    );
  }
}
