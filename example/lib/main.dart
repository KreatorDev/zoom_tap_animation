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
    void _snackMsg(String txt) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          txt,
          textAlign: TextAlign.center,
        ),
        duration: Duration(
          milliseconds: 200,
        ),
      ));
    }

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
                  // your child widget that you want to put the zoom effect on.
                  child: Container(
                    margin: EdgeInsets.only(bottom: 30.0),
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 18.0 * i),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Column(
                      children: [
                        FlutterLogo(
                          size: 30.0 * i,
                        ),
                        SizedBox(height: 10.0),
                        Text(i == 3
                            ? 'Long Tap'
                            : i == 2
                                ? 'Long Tap Loop'
                                : 'One Tap')
                      ],
                    ),
                  ),
                  // what should happen when you long tap on the widget.
                  onLongTap: i == 3 && i != 2
                      ? () {
                          _snackMsg('Long Tap Event');
                        }
                      : null,
                  // option to enable long tap loop which repeat every onTap event (in case onLongTap is specified, it repeats the onLongTap event).
                  enableLongTapRepeatEvent: i == 2,
                  // what should happen when you tap on the widget.
                  onTap: () {
                    if (i != 3)
                      _snackMsg(i == 2 ? 'Long Tap Loop' : 'Tap Event');
                  },
                  // the size of widget you want to begin with.
                  begin: 1.0,
                  // the size of widget you want to end with.
                  end: 0.9,
                  // the duration between every onTap/onLongTap loop event.
                  longTapRepeatDuration: const Duration(milliseconds: 100),
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
