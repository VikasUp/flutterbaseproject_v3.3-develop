import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp_verified.g.dart';

@JsonSerializable()
class OTPVerified extends Equatable {
  final String? message;
  final String? idToken;
  final int? httpStatus;
  final int? id;
  final int? applicationStatusCode;
  final bool? profileComplete;

  const OTPVerified({this.message, this.idToken, this.httpStatus, this.id, this.applicationStatusCode, this.profileComplete});

  factory OTPVerified.fromJson(Map<String, dynamic> data) => _$OTPVerifiedFromJson(data);

  Map<String, dynamic> toJson() => _$OTPVerifiedToJson(this);

  @override
  List<Object?> get props => [idToken];
}