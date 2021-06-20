import 'package:flutter/material.dart';
import 'package:hands_on_layouts/favor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: FavorsPage(
        pendingAnswerFavors: mockPendingFavors,
        completedFavors: mockCompletedFavors,
        refusedFavors: mockRefusedFavors,
        acceptedFavors: mockDoingFavors,
      ),
    );
  }
}

class FavorsPage extends StatelessWidget {
  // using mock values from mock_favors file for now
  final List<Favor>? pendingAnswerFavors;
  final List<Favor>? acceptedFavors;
  final List<Favor>? completedFavorsFavors;
  final List<Favor>? refusedFavors;

  FavorsPage({
    required Key key,
    this.pendingAnswerFavors,
    this.acceptedFavors,
    this.completedFavorsFavors,
    this.refusedFavors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
