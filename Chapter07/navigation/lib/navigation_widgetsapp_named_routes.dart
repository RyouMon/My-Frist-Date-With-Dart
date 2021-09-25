import 'package:flutter/material.dart';

class NavigatorNamedRoutesWidgetsApp extends StatefulWidget {
  @override
  _NavigatorNamedRoutesWidgetsAppState createState() => _NavigatorNamedRoutesWidgetsAppState();
}

class _NavigatorNamedRoutesWidgetsAppState extends State<NavigatorNamedRoutesWidgetsApp> {
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: Colors.blue,
      routes: {
        '/': (context) => _screen1(context),
        '/2': (context) => _screen2(context),
      },
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
              child: Text("Go to Screen2"),
              onPressed: () {
                Navigator.of(context).pushNamed('/2');
              })
        ],
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
