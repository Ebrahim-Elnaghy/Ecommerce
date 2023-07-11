import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/sign_up_entity.dart';
import '../../domain/entities/user_data.dart';

abstract class SignUpDataSources{

  Future<Either<Failures, SignUpEntity>> signUp(UserData userData);
}