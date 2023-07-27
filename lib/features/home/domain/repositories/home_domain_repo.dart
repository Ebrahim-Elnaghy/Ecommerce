import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/category_or_brand_entity.dart';
import '../entities/fev_entity.dart';
import '../entities/get_fav_entity.dart';
import '../entities/product_entity.dart';

abstract class HomeDomainRepo {
  Future<Either<Failures, CategoryOrBrandEntity>> getCategories();

  Future<Either<Failures, CategoryOrBrandEntity>> getBrands();
  Future<Either<Failures, ProductEntity>> getElectronicsProducts();
  Future<Either<Failures, ProductEntity>> getMenFashionProducts();
  Future<Either<Failures, ProductEntity>> getWomenFashionProducts();
  Future<Either<Failures, FavEntity>> addToFav(String productId);
  Future<Either<Failures,GetFavEntity>> getFav();
  Future<Either<Failures,FavEntity>> removeFromFav(String productId);
}
