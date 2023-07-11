import 'package:dartz/dartz.dart';

import 'package:route_e_commerce/core/error/failures.dart';
import 'package:route_e_commerce/features/sign_up/domain/entities/sign_up_entity.dart';
import 'package:route_e_commerce/features/sign_up/domain/entities/user_data.dart';

import '../../domain/repositories/sign_up_domain_repo.dart';
import '../datasources/sign_sup_data_sources.dart';

class SignUpDataRepo implements SignUpDomainRepo {
  SignUpDataSources signUpDataSources;

  SignUpDataRepo({
    required this.signUpDataSources,
  });

  @override
  Future<Either<Failures, SignUpEntity>> signUp(UserData userData) =>
      signUpDataSources.signUp(userData);
}
