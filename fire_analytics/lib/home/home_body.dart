import 'package:fire_analytics/home/home_bloc.dart';
import 'package:fire_analytics/home/home_events.dart';
import 'package:fire_analytics/sample_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 150,
          height: 50,
          child: RaisedButton(
            onPressed: () => homeBloc.add(SendLogEvent(name: "Sample log", params: {"Hi":"test"})),
            child: Text("Send log"),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: 150,
          height: 50,
          child: RaisedButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SamplePage(), settings: RouteSettings(name: "/samplePage"))),
            child: Text("Go to another page"),
          ),
        )
      ],
    );
  }
}