import 'package:flutter/material.dart';
import 'package:remote_config/home/home_provider.dart';
import 'package:remote_config/home_without_bloc/home_body.dart';
import 'package:remote_config/home_without_bloc/home_body_int.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: HomeBody(),
      home: HomeBodyInt()
      //home: HomeProvider(),
    );
  }
}