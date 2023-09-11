import 'package:base_project/core/util/utilities.dart';
import 'package:base_project/data/datasources/breakers_datasource.dart';
import 'package:base_project/domain/usecases/divison_list.dart';
import 'package:base_project/domain/usecases/team_list.dart';
import 'package:base_project/presentation/breakers_paradise/bloc/breakers_event.dart';
import 'package:base_project/presentation/breakers_paradise/bloc/breakers_state.dart';
import 'package:bloc/bloc.dart';

class BreakersBloc extends Bloc<BreakersEvent, BreakersState> {
  final Teams teamslistContent;
  final BreakersDatasource datasource;
  final Division divisionList;

  BreakersBloc(
      {required this.teamslistContent,
      required this.datasource,
      required this.divisionList})
      : super(BreakersStateInitial()) {
    on<BreakersTeamListEvent>(fetchTeamList);
    on<BreakersDivisionListEvent>(fetchDivisionList);
  }

  Future<void> fetchTeamList(
      BreakersTeamListEvent event, Emitter<BreakersState> emit) async {
    emit(BreakersStateLoading());
    final result = await teamslistContent(teamsResponse());
    result.fold(
      (failure) async {
        Utilities.addLogOnFailure(failure);
        emit(BreakersTeamListFailure(error: failure.toString()));
      },
      (success) async {
        emit(BreakersTeamListSuccess(teamslistContent: success));
      },
    );
  }

  Future<void> fetchDivisionList(
      BreakersDivisionListEvent event, Emitter<BreakersState> emit) async {
    emit(BreakersStateLoading());
    final result = await divisionList(divisionResponse());
    result.fold(
      (failure) async {
        Utilities.addLogOnFailure(failure);
        emit(divisionListFailure(error: failure.toString()));
      },
      (success) async {
        emit(BreakersDivisionListSuccess(divisionList: success));
      },
    );
  }
}
