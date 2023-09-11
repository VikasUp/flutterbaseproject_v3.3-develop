import 'package:base_project/data/models/division_response.dart';
import 'package:base_project/data/models/teams_response.dart';
import 'package:equatable/equatable.dart';

abstract class BreakersState extends Equatable {
  const BreakersState();

  @override
  List<Object> get props => [];
}

class BreakersStateInitial extends BreakersState {}

class BreakersStateLoading extends BreakersState {}

class BreakersTeamListSuccess extends BreakersState {
  final List<TeamResponse> teamslistContent;

  const BreakersTeamListSuccess({required this.teamslistContent});

  @override
  List<Object> get props => [];

  get teams => [];
  @override
  String toString() => 'Successfully shown Team list ';
}

class BreakersTeamListFailure extends BreakersState {
  final String error;

  const BreakersTeamListFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'Team Failure { error: $error }';
}

class BreakersDivisionListSuccess extends BreakersState {
  final List<DivisionResponse> divisionList;

  const BreakersDivisionListSuccess({required this.divisionList});

  @override
  List<Object> get props => [];

  get division => [];

  @override
  String toString() => 'Successfully shown Team list ';
}

class divisionListFailure extends BreakersState {
  final String error;

  const divisionListFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'Team Failure { error: $error }';
}
