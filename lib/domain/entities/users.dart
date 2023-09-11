import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '/domain/entities/index.dart';

part 'users.g.dart';

@JsonSerializable()
class Users extends Equatable {
  final List<User>? content;
  final bool? empty;
  final bool? first;
  final bool? last;
  final int? number;
  final int? numberOfElements;
  final int? size;
  final int? totalElements;
  final int? totalPages;

  factory Users.fromJson(Map<String, dynamic> data) => _$UsersFromJson(data);

  const Users(this.content, this.empty, this.first, this.last, this.number, this.numberOfElements, this.size, this.totalElements, this.totalPages);

  Map<String, dynamic> toJson() => _$UsersToJson(this);

  @override
  List<Object?> get props => [];

}