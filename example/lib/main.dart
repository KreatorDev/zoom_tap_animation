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
                    // what should happen when you tap on the widget.
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
                  // the size of widget you want to begin with.
                  begin: 1.0,
                  // the size of widget you want to end with.
                  end: 0.9,
                  // the duration of the begin zoom in animation.
                  beginDuration: const Duration(milliseconds: 20),
                  // the duration of the end zoom in animation.
                  endDuration: const Duration(milliseconds: 120),
                  // the curve animation type of the begin zoom in animation.
                  beginCurve: Curves.decelerate,
                  // the curve animation type of the end zoom in animation.
                  endCurve: Curves.fastOutSlowIn),
          ],
        ),
      ),
    );
  }
}
