import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasources/home_data_sources.dart';
import '../../data/repositories/home_data_repo.dart';
import '../../domain/repositories/home_domain_repo.dart';
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
  List<Widget> screens =const [HomeTab(), CategoryTab(), FavTab(), ProfileTab()];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNavState());
  }
}
