import 'package:equatable/equatable.dart';

abstract class BreakersEvent extends Equatable {
  const BreakersEvent();
}

class BreakersTeamListEvent extends BreakersEvent {
  @override
  List<Object?> get props => [];
}

class BreakersDivisionListEvent extends BreakersEvent {
  @override
  List<Object?> get props => [];
}
