import 'package:flutter/material.dart';

class NavigatorNamedRoutesArgumentsApp extends StatefulWidget {
  @override
  _NavigatorNamedRoutesArgumentsAppState createState() =>
      _NavigatorNamedRoutesArgumentsAppState();
}

class _NavigatorNamedRoutesArgumentsAppState
    extends State<NavigatorNamedRoutesArgumentsApp> {
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: Colors.blue,
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => _screen1(context));
        } else if (settings.name == '/2') {
          return MaterialPageRoute(
              builder: (context) =>
                  _screen2(context, settings.arguments as String));
        }
      },
    );
  }

  _screen2(BuildContext context, String message) {
    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          Text("Screen 2"),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Go to Screen1")),
          Text(message),
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
                Navigator.of(context)
                    .pushNamed('/2', arguments: "Hello from screen 1");
              })
        ],
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
