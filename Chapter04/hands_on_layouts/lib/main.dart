import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hands_on_layouts/favor.dart';
import 'package:hands_on_layouts/friend.dart';
import 'package:hands_on_layouts/mock_values.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

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
  final List<Favor> pendingAnswerFavors;
  final List<Favor> acceptedFavors;
  final List<Favor> completedFavors;
  final List<Favor> refusedFavors;

  FavorsPage({
    Key? key,
    required this.pendingAnswerFavors,
    required this.acceptedFavors,
    required this.completedFavors,
    required this.refusedFavors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Your favors"),
          bottom: TabBar(tabs: [
            _buildCategoryTab("Requests"),
            _buildCategoryTab("Doing"),
            _buildCategoryTab("Completed"),
            _buildCategoryTab("Refused"),
          ]),
        ),
        body: TabBarView(children: [
          _favorsList("Pending Requests", pendingAnswerFavors),
          _favorsList("Doing", acceptedFavors),
          _favorsList("Completed", completedFavors),
          _favorsList("Refused", refusedFavors),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Ask a favor',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildCategoryTab(String title) {
    return Tab(
      child: Text(title),
    );
  }

  Widget _favorsList(String title, List<Favor> favors) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Text(title),
        ),
        Expanded(
            child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: favors.length,
          itemBuilder: (BuildContext context, int index) {
            final favor = favors[index];
            return Card(
              key: ValueKey(favor.uuid),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: Padding(
                child: Column(
                  children: <Widget>[
                    _itemHeader(favor),
                    Text(favor.description),
                    _itemFooter(favor),
                  ],
                ),
                padding: EdgeInsets.all(8.0),
              ),
            );
          },
        ))
      ],
    );
  }

  Row _itemHeader(Favor favor) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(
            favor.friend.photoURL,
          ),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text("${favor.friend.name} asked you to"),
        ))
      ],
    );
  }

  Widget _itemFooter(Favor favor) {
    if (favor.isCompleted) {
      final format = DateFormat();
      return Container(
        margin: EdgeInsets.only(top: 8.0),
        alignment: Alignment.centerRight,
        child: Chip(
          label: Text("Completed at: ${format.format(favor.completed!)}"),
        ),
      );
    }

    if (favor.isRequested) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(onPressed: () {}, child: Text("Refuse")),
          TextButton(onPressed: () {}, child: Text("Do")),
        ],
      );
    }

    if (favor.isDoing) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(onPressed: () {}, child: Text("Give up")),
          TextButton(onPressed: () {}, child: Text("Complete")),
        ],
      );
    }

    return Container();
  }
}

class RequestFavorPage extends StatelessWidget {
  final List<Friend> friends;

  RequestFavorPage({Key? key, required this.friends}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Requesting a favor"),
          leading: CloseButton(),
          actions: <Widget>[
            TextButton(onPressed: () {}, child: Text("SAVE")),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Request a favor to: "),
              DropdownButtonFormField(
                items: friends
                    .map((e) => DropdownMenuItem(child: Text(e.name)))
                    .toList(),
              ),
              Container(
                height: 16.0,
              ),
              Text("Favor description:"),
              TextFormField(
                maxLines: 5,
                inputFormatters: [LengthLimitingTextInputFormatter(200)],
              ),
              Container(
                height: 16.0,
              ),
              Text("Due Date:"),
              DateTimeField(
                format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
                onShowPicker: (context, currentValue) async {
                  final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                  if (date != null) {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(
                          currentValue ?? DateTime.now()),
                    );
                    return DateTimeField.combine(date, time);
                  } else {
                    return currentValue;
                  }
                },
              )
            ],
          ),
        ) // continues below,
        );
  }
}
