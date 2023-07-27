part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeChangeBottomNavState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeGetCategoriesSuccessState extends HomeState {
  CategoryOrBrandEntity categoryOrBrandEntity;

  HomeGetCategoriesSuccessState({required this.categoryOrBrandEntity});
}

class HomeGetCategoriesErrorState extends HomeState {
  Failures failure;

  HomeGetCategoriesErrorState({required this.failure});
}

class HomeGetBrandsSuccessState extends HomeState {
  CategoryOrBrandEntity categoryOrBrandEntity;

  HomeGetBrandsSuccessState({required this.categoryOrBrandEntity});
}

class HomeGetBrandsErrorState extends HomeState {
  Failures failure;

  HomeGetBrandsErrorState({required this.failure});
}

class HomeGetElectronicsSuccessState extends HomeState {
  ProductEntity productEntity;

  HomeGetElectronicsSuccessState({required this.productEntity});
}

class HomeGetElectronicsErrorState extends HomeState {
  Failures failure;

  HomeGetElectronicsErrorState({required this.failure});
}

class HomeGetMenFashionSuccessState extends HomeState {
  ProductEntity productEntity;

  HomeGetMenFashionSuccessState({required this.productEntity});
}

class HomeGetMenFashionErrorState extends HomeState {
  Failures failure;

  HomeGetMenFashionErrorState({required this.failure});
}

class HomeGetWomenFashionSuccessState extends HomeState {
  ProductEntity productEntity;

  HomeGetWomenFashionSuccessState({required this.productEntity});
}

class HomeGetWomenFashionErrorState extends HomeState {
  Failures failure;

  HomeGetWomenFashionErrorState({required this.failure});
}

class HomeAddToFavSuccessState extends HomeState {
  FavEntity fevEntity;

  HomeAddToFavSuccessState({required this.fevEntity});
}

class HomeAddToFavErrorState extends HomeState {
  Failures failure;

  HomeAddToFavErrorState({required this.failure});
}

class HomeGetFavLoadingState extends HomeState {}


class HomeGetFavSuccessState extends HomeState {
  GetFavEntity getFavEntity;

  HomeGetFavSuccessState({required this.getFavEntity});
}

class HomeGetFavErrorState extends HomeState {
  Failures failure;

  HomeGetFavErrorState({required this.failure});
}

class HomeRemoveFromFavSuccessState extends HomeState {
  FavEntity favEntity;

  HomeRemoveFromFavSuccessState({required this.favEntity});
}

class HomeRemoveFromFavErrorState extends HomeState {
  Failures failure;

  HomeRemoveFromFavErrorState({required this.failure});
}

class ChangeFavState extends HomeState {}
