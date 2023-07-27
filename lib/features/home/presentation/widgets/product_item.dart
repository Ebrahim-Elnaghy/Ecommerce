import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../domain/entities/product_entity.dart';
import '../cubit/home_cubit.dart';

class ProductItem extends StatelessWidget {
  final ProductDataEntity productDataEntity;

  const ProductItem({super.key, required this.productDataEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 211.h,
      width: 158.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: AppColors.borderColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13), topRight: Radius.circular(13)),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Image.network(
                  productDataEntity.imageCover ?? '',
                  width: 158.w,
                  height: 128.h,
                  fit: BoxFit.cover,
                ),
                IconButton(
                    onPressed: () {
                      HomeCubit.get(context).changeFav(productDataEntity.id!);
                    },
                    icon: HomeCubit.get(context)
                                .isFavorite[productDataEntity.id] ==
                            true
                        ? Image.asset('assets/icons/select_fev_item_icon.png')
                        : Image.asset(
                            'assets/icons/unselect_fev_item_icon.png'))
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              productDataEntity.title ?? '',
              style:
                  poppins14W400(color: AppColors.primary).copyWith(height: 1.1),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'EGP ${productDataEntity.price}',
              style:
                  poppins14W400(color: AppColors.primary).copyWith(height: 1.1),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 5, bottom: 8),
            child: Row(
              children: [
                Text(
                  'Review',
                  style: poppins14W400(color: AppColors.primary)
                      .copyWith(height: 1.1),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  '(${productDataEntity.ratingsAverage})',
                  style: poppins12W400(color: AppColors.primary),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 15,
                ),
                const Spacer(),
                SizedBox(
                  width: 30.w,
                  height: 30.h,
                  child: FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: AppColors.primary,
                    child: const Icon(
                      Icons.add,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
