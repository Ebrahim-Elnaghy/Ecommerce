import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/constants.dart';
import '../models/login_model.dart';

abstract class LoginDataSources {
  Future<Either<Failures, LoginModel>> login(String email, String password);
}

class LoginRemoteDto implements LoginDataSources {
  Dio dio = Dio();
  LoginRemoteDto(){
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      request: true,
      requestBody: true,
    ));
  }
  @override
  Future<Either<Failures, LoginModel>> login(
      String email, String password) async {
    try {
      var response =
      await dio.post("${Constants.baseApiUrl}${EndPoints.login}", data: {
        "email": email,
        "password": password,
      });

      LoginModel loginModel = LoginModel.fromJson(response.data);
      return Right(loginModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}