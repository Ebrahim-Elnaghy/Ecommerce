import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/category_or_brand_entity.dart';
import '../repositories/home_domain_repo.dart';

class GetCategoriesUseCase {
  HomeDomainRepo homeDomainRepo;

  GetCategoriesUseCase(this.homeDomainRepo);

  Future<Either<Failures, CategoryOrBrandEntity>> call() =>
      homeDomainRepo.getCategories();
}
