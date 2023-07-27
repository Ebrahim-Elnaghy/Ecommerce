import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/fev_entity.dart';
import '../../domain/entities/get_fav_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/add_to_fav_use_case.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/app_images.dart';
import '../../data/datasources/home_data_sources.dart';
import '../../data/repositories/home_data_repo.dart';
import '../../domain/entities/category_or_brand_entity.dart';
import '../../domain/repositories/home_domain_repo.dart';
import '../../domain/usecases/get_brands_use_case.dart';
import '../../domain/usecases/get_categories_use_case.dart';
import '../../domain/usecases/get_electronics_products_use_case.dart';
import '../../domain/usecases/get_fav_use_case.dart';
import '../../domain/usecases/get_men_fashion_products_use_case.dart';
import '../../domain/usecases/get_women_fashion_products_use_case.dart';
import '../../domain/usecases/remove_from_fav_use_case.dart';
import '../pages/tabs/profile_tab.dart';
import '../pages/tabs/home_tab.dart';
import '../pages/tabs/fav_tab.dart';
import '../pages/tabs/category_tab.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeDataSources homeDataSources;
  late HomeDomainRepo homeDomainRepo;

  HomeCubit({required this.homeDataSources}) : super(HomeInitial()) {
    homeDomainRepo = HomeDataRepo(homeDataSources: homeDataSources);
  }

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  Map<String?, bool> isFavorite = {};
  List<Widget> screens = const [
    HomeTab(),
    CategoryTab(),
    FavTab(),
    ProfileTab()
  ];
  List<String> sliders = [
    AppImages.sliderOne,
    AppImages.sliderTwo,
    AppImages.sliderThree
  ];
  List<DataEntity> categories = [];
  List<DataEntity> brands = [];
  List<ProductDataEntity> electronics = [];
  List<ProductDataEntity> menFashion = [];
  List<ProductDataEntity> womenFashion = [];
  List<FavDataEntity> favorites = [];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNavState());
  }
  void getCategories() async {
    emit(HomeLoadingState());
    GetCategoriesUseCase getCategoriesUseCase =
        GetCategoriesUseCase(homeDomainRepo);
    var result = await getCategoriesUseCase.call();
    result.fold((l) {
      emit(HomeGetCategoriesErrorState(failure: l));
    }, (r) {
      categories = r.data ?? [];
      emit(HomeGetCategoriesSuccessState(categoryOrBrandEntity: r));
    });
  }
  void getBrands() async {
    emit(HomeLoadingState());
    GetBrandsUseCase getBrandsUseCase = GetBrandsUseCase(homeDomainRepo);
    var result = await getBrandsUseCase.call();
    result.fold((l) {
      emit(HomeGetBrandsErrorState(failure: l));
    }, (r) {
      brands = r.data ?? [];
      emit(HomeGetBrandsSuccessState(categoryOrBrandEntity: r));
    });
  }
  Future<void> getFav() async {
    emit(HomeGetFavLoadingState());
    GetFavUseCase getFavUseCase = GetFavUseCase(homeDomainRepo);
    var result = await getFavUseCase.call();
    result.fold((l) {
      emit(HomeGetFavErrorState(failure: l));
    }, (r) {
      favorites = r.data!;
      emit(HomeGetFavSuccessState(getFavEntity: r));
    });
  }
  void isProductInFavorites(List<ProductDataEntity> products) async {
    if (favorites.isEmpty) {
      await getFav();
    }
    for (var product in products) {
      isFavorite[product.id] = favorites.any((favItem) => favItem.id == product.id);
    }
  }
  void getElectronicsProducts() async {
    emit(HomeLoadingState());
    GetElectronicsProductsUseCase getElectronicsProductsUseCase =
        GetElectronicsProductsUseCase(homeDomainRepo);
    var result = await getElectronicsProductsUseCase.call();
    result.fold((l) {
      emit(HomeGetElectronicsErrorState(failure: l));
    }, (r) {
      electronics = r.data ?? [];
      isProductInFavorites(electronics);
      emit(HomeGetElectronicsSuccessState(productEntity: r));
    });
  }
  void getMenFashionProducts() async {
    emit(HomeLoadingState());
    GetMenFashionProductsUseCase getMenFashionProductsUseCase =
        GetMenFashionProductsUseCase(homeDomainRepo);
    var result = await getMenFashionProductsUseCase.call();
    result.fold((l) {
      emit(HomeGetMenFashionErrorState(failure: l));
    }, (r) {
      menFashion = r.data ?? [];
      isProductInFavorites(menFashion);
      emit(HomeGetMenFashionSuccessState(productEntity: r));
    });
  }
  void getWomenFashionProducts() async {
    emit(HomeLoadingState());
    GetWomenFashionProductsUseCase getWomenFashionProductsUseCase =
        GetWomenFashionProductsUseCase(homeDomainRepo);
    var result = await getWomenFashionProductsUseCase.call();
    result.fold((l) {
      emit(HomeGetWomenFashionErrorState(failure: l));
    }, (r) {
      womenFashion = r.data ?? [];
      isProductInFavorites(womenFashion);
      emit(HomeGetWomenFashionSuccessState(productEntity: r));
    });
  }
  void addToFav(String productId) async {
    AddToFavUseCase addToFavUseCase = AddToFavUseCase(homeDomainRepo);
    var result = await addToFavUseCase.call(productId);
    result.fold((l) {
      emit(HomeAddToFavErrorState(failure: l));
    }, (r) async {
      await getFav();
      emit(HomeAddToFavSuccessState(fevEntity: r));
    });
  }
  void removeFromFav(String productId) async {
    RemoveFromFavUseCase removeFromFavUseCase = RemoveFromFavUseCase(homeDomainRepo);
    var result = await removeFromFavUseCase.call(productId);
    result.fold((l) {
      emit(HomeRemoveFromFavErrorState(failure: l));
    }, (r) async {
      await getFav();
      emit(HomeRemoveFromFavSuccessState(favEntity: r));
    });
  }
  void changeFav(String productId)  {
    if(isFavorite[productId]==false){
      isFavorite[productId]=true;
      emit(ChangeFavState());
      addToFav(productId);
    }else{
      isFavorite[productId]=false;
      emit(ChangeFavState());
      removeFromFav(productId);
    }

  }

}
