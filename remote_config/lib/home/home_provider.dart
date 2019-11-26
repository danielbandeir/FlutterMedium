import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remote_config/home/home_bloc.dart';
import 'package:remote_config/home/home_body.dart';

class HomeProvider extends StatefulWidget {
  @override
  _HomeProviderState createState() => _HomeProviderState();
}

class _HomeProviderState extends State<HomeProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider<HomeBloc>(
        builder: (_) => HomeBloc(),
        dispose: (_, bloc) => bloc.dispose(),
        child: HomeBody(),
      ),
    );
  }
}