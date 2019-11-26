import 'package:firebase_remote_config/firebase_remote_config.dart';

class HomeBloc {

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
  void dispose() {
  }
  
}