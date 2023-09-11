import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final int? id;
  final String? userName;
  final String? email;
  final int? phoneNumber;
  final String? imageUrl;
  final String? firstName;
  final String? lastName;
  final String? activationKey;
  final bool? status;

  const User(
      {this.id,
      this.userName,
      this.email,
      this.phoneNumber,
      this.imageUrl,
      this.firstName,
      this.lastName,
      this.activationKey,
      this.status});

  factory User.fromJson(Map<String, dynamic> data) => _$UserFromJson(data);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [id];
}
