import 'package:dartz/dartz.dart';
import '../models/category_or_brand_model.dart';
import '../models/get_fev_model.dart';
import '../models/product_model.dart';

import '../../../../core/error/failures.dart';
import '../models/fev_model.dart';

abstract class HomeDataSources {
  Future<Either<Failures, CategoryOrBrandModel>> getCategories();

  Future<Either<Failures, CategoryOrBrandModel>> getBrands();

  Future<Either<Failures, ProductModel>> getElectronicsProducts();
  Future<Either<Failures, ProductModel>> getMenFashionProducts();
  Future<Either<Failures, ProductModel>> getWomenFashionProducts();
  Future<Either<Failures, FavModel>> addToFev(String productId);
  Future<Either<Failures,GetFevModel>> getFav();
  Future<Either<Failures,FavModel>> removeFromFav(String productId);



}
