
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '/core/error/error_index.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParam extends Equatable {
  @override
  List<Object?> get props => [];
}