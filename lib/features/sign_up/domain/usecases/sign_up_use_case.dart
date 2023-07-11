import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/sign_up_entity.dart';
import '../entities/user_data.dart';
import '../repositories/sign_up_domain_repo.dart';

class SignUpUseCase {
  SignUpDomainRepo signUpDomainRepo;

  SignUpUseCase(this.signUpDomainRepo);

  Future<Either<Failures, SignUpEntity>> call(UserData userData) =>
      signUpDomainRepo.signUp(userData);
}