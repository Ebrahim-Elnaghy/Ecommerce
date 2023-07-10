import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce/features/home/presentation/cubit/home_cubit.dart';

import '../../core/utils/components.dart';
import '../../features/home/data/datasources/home_remote_dto.dart';
import '../../features/home/presentation/pages/home.dart';

class Routes {
  static const String home = "homeScreen";
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) =>  BlocProvider(
            create: (context) => HomeCubit(homeDataSources: HomeRemoteDto()),
            child: const HomeScreen(),
          ),
        );

      default:
        return MaterialPageRoute(builder: (context) => unDefineRoute());
    }
  }
}
