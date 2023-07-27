import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../models/fev_model.dart';
import '../models/get_fev_model.dart';
import '../models/product_model.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/utils/cache_helper.dart';
import '../../../../core/utils/constants.dart';
import '../models/category_or_brand_model.dart';
import 'home_data_sources.dart';

class HomeRemoteDto implements HomeDataSources {
  Dio dio = Dio();
  var token = CacheHelper.getData('userToken');

  HomeRemoteDto() {
    // dio.interceptors.add(LogInterceptor(
    //   responseBody: true,
    //   error: true,
    //   requestHeader: false,
    //   responseHeader: false,
    //   request: true,
    //   requestBody: true,
    // ));
  }

  @override
  Future<Either<Failures, CategoryOrBrandModel>> getBrands() async {
    try {
      var response = await dio.get(
        "${Constants.baseApiUrl}${EndPoints.getAllBrands}",
      );
      CategoryOrBrandModel model = CategoryOrBrandModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandModel>> getCategories() async {
    try {
      var response = await dio.get(
        "${Constants.baseApiUrl}${EndPoints.getAllCategories}",
      );
      CategoryOrBrandModel model = CategoryOrBrandModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductModel>> getElectronicsProducts() async {
    try {
      var response = await dio.get(
          "${Constants.baseApiUrl}${EndPoints.getAllProducts}",
          queryParameters: {'category[in]': Constants.electronicsCategoryId});
      ProductModel model = ProductModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductModel>> getMenFashionProducts() async {
    try {
      var response = await dio.get(
          "${Constants.baseApiUrl}${EndPoints.getAllProducts}",
          queryParameters: {'category[in]': Constants.menFashionCategoryId});
      ProductModel model = ProductModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductModel>> getWomenFashionProducts() async {
    try {
      var response = await dio.get(
          "${Constants.baseApiUrl}${EndPoints.getAllProducts}",
          queryParameters: {'category[in]': Constants.womenFashionCategoryId});
      ProductModel model = ProductModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, FavModel>> addToFev(String productId) async {
    try {
      var response = await dio.post(
          "${Constants.baseApiUrl}${EndPoints.wishlist}",
          options: Options(headers: {"token": token}),
          data: {"productId": productId});

      FavModel fevModel = FavModel.fromJson(response.data);

      return Right(fevModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetFevModel>> getFav()  async{
    try {
      var response = await dio.get(
          "${Constants.baseApiUrl}${EndPoints.wishlist}",
          options: Options(headers: {"token": token}),);

      GetFevModel getFevModel = GetFevModel.fromJson(response.data);

      return Right(getFevModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, FavModel>> removeFromFav(String productId) async{
    try {
      var response = await dio.delete(
        "${Constants.baseApiUrl}${EndPoints.wishlist}/$productId",
        options: Options(headers: {"token": token}),);

      FavModel favModel = FavModel.fromJson(response.data);

      return Right(favModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}
