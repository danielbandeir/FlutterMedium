import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SendLogEvent extends HomeEvent {
  final String name;
  final Map<String, dynamic> params;
  
  SendLogEvent({@required this.name, this.params});

  @override
  List<Object> get props => [name, params];
  
}