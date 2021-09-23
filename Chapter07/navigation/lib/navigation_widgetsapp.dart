import 'package:flutter/material.dart';

class NavigatorWidgetsApp extends StatefulWidget {
  @override
  _NavigatorWidgetsAppState createState() => _NavigatorWidgetsAppState();
}

class _NavigatorWidgetsAppState extends State<NavigatorWidgetsApp> {
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: Colors.blue,
      home: Builder(builder: (context) => _screen1(context)),
      pageRouteBuilder: <Void>(settings, builder) {
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }

  _screen2(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          Text("Screen 2"),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Go to Screen1"))
        ],
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }

  _screen1(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        children: [
          Text("Screen 1"),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return _screen2(context);
                }));
              },
              child: Text("Go to Screen2"))
        ],
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
