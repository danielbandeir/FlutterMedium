import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:remote_config/home/home_bloc.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<HomeBloc>(context);
    return Container(
      child: FutureBuilder<RemoteConfig>(
        future: bloc.initializeRemoteConfig(),
        builder: (BuildContext context, AsyncSnapshot<RemoteConfig> snapshot) {
          return Center(
            child: snapshot.hasData ? Text(snapshot.data.getString("Example")) : CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}