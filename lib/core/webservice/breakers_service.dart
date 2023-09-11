import 'package:base_project/core/constant/sfl_apis.dart';
import 'package:base_project/data/models/division_response.dart';
import 'package:base_project/data/models/division_response.dart';
import 'package:base_project/data/models/teams_response.dart';
import 'package:base_project/data/models/teams_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'breakers_service.g.dart';

@RestApi(baseUrl: '')
abstract class BreakersService {
  factory BreakersService(Dio dio, {String baseUrl}) = _BreakersService;

  @GET(SFLAPIs.divisionResponse)
  Future<HttpResponse<List<DivisionResponse>>> divisionResponse();

  @GET(SFLAPIs.saveResponse)
  Future<HttpResponse<List<DivisionResponse>>> saveResponse();

  @GET(SFLAPIs.teamResponse)
  Future<HttpResponse<List<TeamResponse>>> teamResponse();
}
