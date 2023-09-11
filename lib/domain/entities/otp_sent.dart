import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp_sent.g.dart';

@JsonSerializable()
class OTPSent extends Equatable {
  final String? message;
  final int? httpStatus;
  final int? applicationStatusCode;
  final int? id;
  final bool? userActive;

  const OTPSent({this.message, this.httpStatus, this.applicationStatusCode, this.id, this.userActive});

  factory OTPSent.fromJson(Map<String, dynamic> data) => _$OTPSentFromJson(data);

  Map<String, dynamic> toJson() => _$OTPSentToJson(this);

  @override
  List<Object?> get props => [id];

}