import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:remote_config/home_without_bloc/model/home_remote_model.dart';

class HomeBodyJson extends StatefulWidget {
  @override
  _HomeBodyJsonState createState() => _HomeBodyJsonState();
}

class _HomeBodyJsonState extends State<HomeBodyJson> {
  RemoteConfig remoteConfig;

  Future<RemoteConfig> initializeRemoteConfig() async {

    /// Initialize remote config 
    final RemoteConfig remoteConfig = await RemoteConfig.instance; 

    /// Setting defaults values if don't catch from firebase host
    final defaultValues = <String, dynamic>{"ExampleJson": {"example":"example","example2":2}};
    await remoteConfig.setDefaults(defaultValues);

    /// Fetch params for your app, by default the
    /// expiration is 12 hours, but in this example
    /// I used 4 seconds
    await remoteConfig.fetch(expiration: Duration(seconds: 4));

    /// Active fetch configs
    await remoteConfig.activateFetched();

    return remoteConfig;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<RemoteConfig>(
          future: initializeRemoteConfig(),
          builder: (BuildContext context, AsyncSnapshot<RemoteConfig> snapshot) {
            /// Pegue a value do json e tranforma em map
            Map userMap = jsonDecode(snapshot.data.getValue("ExampleJson").asString());
            /// Parse para o model HomeRemote
            HomeRemote home = HomeRemote.fromJson(userMap);
            return Center(
              child: snapshot.hasData ? Text(home.example) : CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}