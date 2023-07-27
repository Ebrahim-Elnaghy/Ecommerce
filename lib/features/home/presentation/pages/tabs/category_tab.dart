import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../cubit/home_cubit.dart';
import '../../widgets/custom_app_bar.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
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
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'Categories',
                              style: poppins18W500(color: AppColors.primary),
                            )),
                        SizedBox(
                          height: 16.h,
                        ),
                        state is HomeLoadingState
                            ? const Center(
                                child: CircularProgressIndicator(
                                color: AppColors.primary,
                              ))
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      HomeCubit.get(context).categories.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 16,
                                          childAspectRatio: 1 / 1.1,
                                          crossAxisSpacing: 16),
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            width: 2,
                                            color: AppColors.borderColor)),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(13),
                                                topRight: Radius.circular(13)),
                                          ),
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: Image.network(
                                            HomeCubit.get(context)
                                                    .categories[index]
                                                    .image ??
                                                '',
                                            fit: BoxFit.cover,
                                            height: 160.h,
                                            width: 191.w,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Text(
                                          HomeCubit.get(context)
                                                  .categories[index]
                                                  .name ??
                                              "",
                                          style: poppins14W400(
                                              color: AppColors.primary),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 16.h,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
