import 'package:base_project/core/error/exception.dart';
import 'package:base_project/core/util/extensions.dart';
import 'package:base_project/core/webservice/api_client.dart';
import 'package:base_project/data/models/division_response.dart';
import 'package:base_project/data/models/division_response.dart';
import 'package:base_project/data/models/teams_response.dart';
import 'package:base_project/data/models/teams_response.dart';
import 'package:retrofit/dio.dart';

abstract class BreakersDatasource {
  Future<List<DivisionResponse>> divisionResponse();
  Future<List<TeamResponse>> teamResponse();
  Future<List<DivisionResponse>> saveResponse();
}

class BreakersDatasourceImpl implements BreakersDatasource {
  @override
  Future<List<DivisionResponse>> divisionResponse() async {
    try {
      HttpResponse<List<DivisionResponse>> response =
          await ApiClient.breakersService.divisionResponse();
      if (response.isSuccessful) {
        return response.data;
      } else {
        throw ServerException();
      }
    } on Failure catch (_) {
      rethrow;
    } catch (error) {
      throw UnknownException(error.toString());
    }
  }

  @override
  Future<List<TeamResponse>> teamResponse() async {
    try {
      HttpResponse<List<TeamResponse>> response =
          await ApiClient.breakersService.teamResponse();
      if (response.isSuccessful) {
        return response.data;
      } else {
        throw ServerException();
      }
    } on Failure catch (_) {
      rethrow;
    } catch (error) {
      throw UnknownException(error.toString());
    }
  }

  @override
  Future<List<DivisionResponse>> saveResponse() async {
    try {
      HttpResponse<List<DivisionResponse>> response =
          await ApiClient.breakersService.saveResponse();
      if (response.isSuccessful) {
        return response.data;
      } else {
        throw ServerException();
      }
    } on Failure catch (_) {
      rethrow;
    } catch (error) {
      throw UnknownException(error.toString());
    }
  }
}
