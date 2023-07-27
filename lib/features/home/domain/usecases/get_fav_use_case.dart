import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/home_domain_repo.dart';

import '../entities/get_fav_entity.dart';

class GetFavUseCase{
  HomeDomainRepo homeDomainRepo;
  GetFavUseCase(this.homeDomainRepo);

  Future<Either<Failures,GetFavEntity>> call()=>homeDomainRepo.getFav();
}