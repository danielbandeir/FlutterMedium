import 'package:equatable/equatable.dart';

abstract class HomeStates extends Equatable {
  @override
  List<Object> get props => [];
}

class SucessSend extends HomeStates {}

class ErrorSend extends HomeStates {}