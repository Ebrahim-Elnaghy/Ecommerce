import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/entities/sign_up_entity.dart';
import '../../domain/entities/user_data.dart';
import '../models/sign_up_model.dart';
import 'sign_sup_data_sources.dart';

class SignUpRemoteDataSource implements SignUpDataSources {
  Dio dio = Dio();

  SignUpRemoteDataSource() {
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
  Future<Either<Failures, SignUpEntity>> signUp(UserData userData) async {
    try {
      var response = await dio.post(
          "${Constants.baseApiUrl}${EndPoints.signUp}",
          data: userData.toJson());

      SignUpModel signUpModel = SignUpModel.fromJson(response.data);
      return Right(signUpModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}
