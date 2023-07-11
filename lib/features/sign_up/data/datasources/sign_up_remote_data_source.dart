import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:route_e_commerce/core/error/failures.dart';
import 'package:route_e_commerce/features/sign_up/data/datasources/sign_sup_data_sources.dart';
import 'package:route_e_commerce/features/sign_up/domain/entities/sign_up_entity.dart';
import 'package:route_e_commerce/features/sign_up/domain/entities/user_data.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/utils/constants.dart';
import '../models/sign_up_model.dart';

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
