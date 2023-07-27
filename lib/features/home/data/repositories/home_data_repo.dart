import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../models/category_or_brand_model.dart';
import '../models/fev_model.dart';
import '../models/get_fev_model.dart';
import '../models/product_model.dart';
import '../../domain/entities/fev_entity.dart';


import '../../domain/repositories/home_domain_repo.dart';
import '../datasources/home_data_sources.dart';

class HomeDataRepo implements HomeDomainRepo {
  HomeDataSources homeDataSources;

  HomeDataRepo({required this.homeDataSources});

  @override
  Future<Either<Failures, CategoryOrBrandModel>> getBrands() =>homeDataSources.getBrands();

  @override
  Future<Either<Failures, CategoryOrBrandModel>> getCategories() =>homeDataSources.getCategories();

  @override
  Future<Either<Failures, ProductModel>> getElectronicsProducts() =>homeDataSources.getElectronicsProducts();

  @override
  Future<Either<Failures, ProductModel>> getMenFashionProducts() =>homeDataSources.getMenFashionProducts();
  @override
  Future<Either<Failures, ProductModel>> getWomenFashionProducts() =>homeDataSources.getWomenFashionProducts();

  @override
  Future<Either<Failures, FavModel>> addToFav(String productId) =>homeDataSources.addToFev(productId);

  @override
  Future<Either<Failures, GetFevModel>> getFav() =>homeDataSources.getFav();

  @override
  Future<Either<Failures, FavEntity>> removeFromFav(String productId) =>homeDataSources.removeFromFav(productId);
}
