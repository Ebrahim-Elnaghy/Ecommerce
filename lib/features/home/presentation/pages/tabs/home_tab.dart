import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/components.dart';
import '../../widgets/custom_app_bar.dart';

import '../../../../../core/utils/text_styles.dart';
import '../../cubit/home_cubit.dart';
import '../../widgets/product_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if(state is HomeAddToFavSuccessState){
          showToast(text: state.fevEntity.message!);
        }
        if(state is HomeRemoveFromFavSuccessState){
          showToast(text: state.favEntity.message!);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomAppBar(),
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 200.h,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 5),
                            autoPlayAnimationDuration:
                                const Duration(seconds: 1),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            scrollDirection: Axis.horizontal,
                            viewportFraction: 1,
                          ),
                          items: HomeCubit.get(context).sliders.map((i) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Image.asset(
                                i,
                                width: 398.w,
                                height: 200.h,
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'Top Brands',
                              style: poppins18W500(color: AppColors.primary),
                            )),
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SizedBox(
                              height: 280.h,
                              child: state is HomeLoadingState
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                      color: AppColors.primary,
                                    ))
                                  : GridView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              mainAxisSpacing: 16,
                                              childAspectRatio: 5 / 3),
                                      itemCount:
                                          HomeCubit.get(context).brands.length,
                                      itemBuilder:
                                          (BuildContext context, int index) =>
                                              CircleAvatar(
                                        radius: 50.0,
                                        backgroundColor: Colors.white,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  HomeCubit.get(context)
                                                          .brands[index]
                                                          .image ??
                                                      ""),
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'Electronics',
                              style: poppins18W500(color: AppColors.primary),
                            )),
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SizedBox(
                            height: 240.h,
                            child: state is HomeLoadingState
                                ? const Center(
                                    child: CircularProgressIndicator(
                                    color: AppColors.primary,
                                  ))
                                : GridView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 1,
                                            mainAxisSpacing: 16,
                                            childAspectRatio: 5 / 3),
                                    itemBuilder: (context, index) =>
                                        ProductItem(
                                      productDataEntity: HomeCubit.get(context)
                                          .electronics[index],
                                    ),
                                    itemCount: HomeCubit.get(context)
                                        .electronics
                                        .length,
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'Men\'s Fashion',
                              style: poppins18W500(color: AppColors.primary),
                            )),
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SizedBox(
                            height: 240.h,
                            child: state is HomeLoadingState
                                ? const Center(
                                    child: CircularProgressIndicator(
                                    color: AppColors.primary,
                                  ))
                                : GridView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 1,
                                            mainAxisSpacing: 16,
                                            childAspectRatio: 5 / 3),
                                    itemBuilder: (context, index) =>
                                        ProductItem(
                                      productDataEntity: HomeCubit.get(context)
                                          .menFashion[index],
                                    ),
                                    itemCount: HomeCubit.get(context)
                                        .menFashion
                                        .length,
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'women\'s Fashion',
                              style: poppins18W500(color: AppColors.primary),
                            )),
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SizedBox(
                            height: 240.h,
                            child: state is HomeLoadingState
                                ? const Center(
                                    child: CircularProgressIndicator(
                                    color: AppColors.primary,
                                  ))
                                : GridView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 1,
                                            mainAxisSpacing: 16,
                                            childAspectRatio: 5 / 3),
                                    itemBuilder: (context, index) =>
                                        ProductItem(
                                      productDataEntity: HomeCubit.get(context)
                                          .womenFashion[index],
                                    ),
                                    itemCount: HomeCubit.get(context)
                                        .womenFashion
                                        .length,
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
