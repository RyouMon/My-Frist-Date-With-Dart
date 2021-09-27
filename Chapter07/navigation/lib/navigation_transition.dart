import 'dart:ui';

import 'package:flutter/material.dart';

class NavigatorTransitionApp extends StatefulWidget {
  @override
  _NavigatorTransitionAppState createState() => _NavigatorTransitionAppState();
}

class _NavigatorTransitionAppState extends State<NavigatorTransitionApp> {
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: Colors.blue,
      routes: {
        '/': (context) => _screen1(context),
        '/2': (context) => _screen2(context),
      },
      pageRouteBuilder: <Void>(settings, builder) {
        return PageRouteBuilder(
            pageBuilder: (context, _, __) => builder(context),
            transitionsBuilder:
                (context, animation, secondaryAnimation, widget) {
              return SlideTransition(
                position: new Tween(begin: Offset(-1.0, 0.0), end: Offset.zero)
                    .animate(animation),
                child: widget,
              );
            });
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
