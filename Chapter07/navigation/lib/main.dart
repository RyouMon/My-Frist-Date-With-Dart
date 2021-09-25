import 'package:flutter/material.dart';
import 'navigation_directly.dart';
import 'navigation_widgetsapp.dart';
import 'navigation_widgetsapp_named_routes.dart';
import 'navigation_widgetsapp_named_routes_arguments.dart';

void main() {
  // example 0 - Navigator directly
  // runApp(NavigatorDirectlyApp());

  // example 1 - WidgetsApp
  // runApp(NavigatorWidgetsApp());

  // example 2 - WidgetApp Named Route
  // runApp(NavigatorNamedRoutesWidgetsApp());

  // example 3 - Passing Arguments
  runApp(NavigatorNamedRoutesArgumentsApp());
}
