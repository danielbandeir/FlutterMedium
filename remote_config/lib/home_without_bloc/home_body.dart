import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  RemoteConfig remoteConfig;

  Future<RemoteConfig> initializeRemoteConfig() async {

    /// Initialize remote config 
    final RemoteConfig remoteConfig = await RemoteConfig.instance; 

    /// Setting defaults values if don't catch from firebase host
    final defaultValues = <String, dynamic>{"Example": "Not found"};
    await remoteConfig.setDefaults(defaultValues);

    /// Fetch params for your app, by default the
    /// expiration is 12 hours
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
            return Center(
              child: snapshot.hasData ? Text(snapshot.data.getString("Example")) : CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}