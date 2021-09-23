import 'package:flutter/material.dart';

class NavigatorDirectlyApp extends StatefulWidget {
  @override
  _NavigatorDirectlyAppState createState() => _NavigatorDirectlyAppState();
}

class _NavigatorDirectlyAppState extends State<NavigatorDirectlyApp>
    with WidgetsBindingObserver {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  Future<bool> didPopRoute() {
    _navigatorKey.currentState!.pop();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Navigator(
          key: _navigatorKey,
          onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute(
                builder: (BuildContext context) => _screen1(context));
          },
        ));
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
