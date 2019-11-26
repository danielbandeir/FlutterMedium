import 'package:fire_analytics/analytics.dart';
import 'package:fire_analytics/home/home_provider.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: <NavigatorObserver> [
        FirebaseAnalyticsObserver(analytics: Analytics().analytics)
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeProvider(),
    );
  }
}

