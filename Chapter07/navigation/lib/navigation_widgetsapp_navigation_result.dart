import 'package:flutter/material.dart';

class NavigatorResultApp extends StatefulWidget {
  @override
  _NavigatorResultAppState createState() => _NavigatorResultAppState();
}

class _NavigatorResultAppState extends State<NavigatorResultApp> {
  String _message = "";

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
                Navigator.of(context).pop("Good bye from screen 2");
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
              onPressed: () async {
                final message = await Navigator.of(context).pushNamed('/2') ??
                    "Came from back button";
                setState(() {
                  _message = message as String;
                });
              }),
          Text(_message),
        ],
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
