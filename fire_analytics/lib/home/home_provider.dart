import 'package:fire_analytics/home/home_bloc.dart';
import 'package:fire_analytics/home/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProvider extends StatefulWidget {
  @override
  _HomeProviderState createState() => _HomeProviderState();
}

class _HomeProviderState extends State<HomeProvider> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      builder: (BuildContext context) => HomeBloc(),
      child: HomeBody()
    );
  }
}