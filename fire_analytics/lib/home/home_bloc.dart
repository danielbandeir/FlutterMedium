import 'package:bloc/bloc.dart';
import 'package:fire_analytics/analytics.dart';
import 'package:fire_analytics/home/home_events.dart';
import 'package:fire_analytics/home/home_states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeStates> {
  @override
  HomeStates get initialState => InitialState();

  @override
  Stream<HomeStates> mapEventToState(HomeEvent event) async* {
    if(event is SendLogEvent) {
      try{
        print("SendLogEvent");
        await Analytics().analytics.logEvent(name: event.name, parameters: event.params);
        yield SucessSend();
      } catch (e) {
        yield ErrorSend();
      }
    }
  }

}