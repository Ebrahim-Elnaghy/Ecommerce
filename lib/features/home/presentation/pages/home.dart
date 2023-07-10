import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          body: HomeCubit.get(context)
              .screens[HomeCubit.get(context).currentIndex],
          bottomNavigationBar: SizedBox(
            height: 56.h,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: BottomNavigationBar(
                selectedFontSize: 0,
                currentIndex: HomeCubit.get(context).currentIndex,
                onTap: (index) {
                  HomeCubit.get(context).changeBottomNav(index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icons/unselect_home_icon.png',
                    ),
                    label: '',
                    activeIcon: Image.asset(
                      'assets/icons/select_home_icon.png',
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icons/unselect_category_icon.png',
                    ),
                    label: '',
                    activeIcon: Image.asset(
                      'assets/icons/select_category_icon.png',
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icons/unselect_fev_icon.png',
                    ),
                    label: '',
                    activeIcon: Image.asset(
                      'assets/icons/select_fev_icon.png',
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icons/unselect_profile_icon.png',
                    ),
                    label: '',
                    activeIcon: Image.asset(
                      'assets/icons/select_profile_icon.png',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
