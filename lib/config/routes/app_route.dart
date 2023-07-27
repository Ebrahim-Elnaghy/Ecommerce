import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/data/datasources/home_remote_dto.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/home/presentation/pages/home.dart';
import '../../features/login/data/datasources/login_data_sources.dart';
import '../../features/login/presentation/cubit/login_cubit.dart';
import '../../features/login/presentation/pages/login.dart';
import '../../features/sign_up/data/datasources/sign_up_remote_data_source.dart';
import '../../features/sign_up/presentation/cubit/sign_up_cubit.dart';
import '../../features/sign_up/presentation/pages/sign_up.dart';
import '../../features/splash/presentation/cubit/splash_cubit.dart';
import '../../features/splash/presentation/pages/splash.dart';

class Routes {
  static const String splash = "/";
  static const String login = "login";
  static const String signUp = "signUp";
  static const String home = "homeScreen";
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SplashCubit(),
            child: const SplashScreen(),
          ),
        );

      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(sources: LoginRemoteDto()),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUp:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                SignUpCubit(signUpDataSources: SignUpRemoteDataSource()),
            child: const SignUpScreen(),
          ),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeCubit(homeDataSources: HomeRemoteDto())
              ..getCategories()
              ..getBrands()
              ..getElectronicsProducts()
              ..getMenFashionProducts()..getWomenFashionProducts(),
            child: const HomeScreen(),
          ),
        );

      default:
        return MaterialPageRoute(builder: (context) => unDefineRoute());
    }
  }
}

Widget unDefineRoute() => const Scaffold(
      body: Center(
        child: Text("UnDefine Route"),
      ),
    );
