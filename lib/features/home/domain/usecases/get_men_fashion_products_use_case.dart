import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/product_entity.dart';

import '../repositories/home_domain_repo.dart';

class GetMenFashionProductsUseCase {
  HomeDomainRepo homeDomainRepo;

  GetMenFashionProductsUseCase(this.homeDomainRepo);
  Future<Either<Failures,ProductEntity>> call()=>homeDomainRepo.getMenFashionProducts();
}
