import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/components.dart';
import '../../../../../core/utils/text_styles.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../cubit/home_cubit.dart';
import '../../widgets/custom_app_bar.dart';

class FavTab extends StatelessWidget {
  const FavTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
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
                child: state is HomeGetFavLoadingState
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ))
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ListView.separated(
                          physics:const  BouncingScrollPhysics(),
                          separatorBuilder: (context, index) => SizedBox(height: 24.h,),
                          itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    width: 1, color: AppColors.borderColor)),
                            child: Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            width: 1,
                                            color: AppColors.borderColor)),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Image.network(
                                      HomeCubit.get(context)
                                              .favorites[index]
                                              .imageCover ??
                                          '',
                                      height: 113.h,
                                      width: 120.w,
                                      fit: BoxFit.cover,
                                    )),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 200.w,
                                            child: Text(
                                              HomeCubit.get(context)
                                                      .favorites[index]
                                                      .title ??
                                                  '',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: poppins18W500(
                                                  color: AppColors.primary),
                                            ),
                                          ),
                                          const Spacer(),
                                          IconButton(
                                              onPressed: () {
                                                HomeCubit.get(context).changeFav(HomeCubit.get(context).favorites[index].id!);
                                              },
                                              icon: HomeCubit.get(context).isFavorite[HomeCubit.get(context).favorites[index].id]==true
                                                  ? Image.asset('assets/icons/select_fev_item_icon.png')
                                                  : Image.asset(
                                                  'assets/icons/unselect_fev_item_icon.png'))
                                        ],
                                      ),
                                      SizedBox(height: 15.h,),
                                      Row(
                                        children: [
                                          Text(
                                            'EGP ${HomeCubit.get(context).favorites[index].price}',
                                            style:
                                            poppins18W500(color: AppColors.primary),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                          const Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 8.0),
                                            child: DefaultButton(
                                              background: AppColors.primary,
                                              isUpperCase: false,
                                              height: 36.h,
                                              width: 118.w,
                                              radius: 15,
                                              function: () {},
                                              text: 'Add to Cart',
                                              textStyle:
                                              poppins14W500(color: Colors.white),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          itemCount: HomeCubit.get(context).favorites.length,
                        )),
              )
            ],
          ),
        );
      },
    );
  }
}
