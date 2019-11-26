import 'package:bloc/bloc.dart';
import 'package:fire_analytics/home/home_events.dart';
import 'package:fire_analytics/home/home_states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeStates> {
  @override
  HomeStates get initialState => InitialState();

  @override
  Stream<HomeStates> mapEventToState(HomeEvent event) async* {
    if(event is SendLogEvent) {
      
    }
  }

}