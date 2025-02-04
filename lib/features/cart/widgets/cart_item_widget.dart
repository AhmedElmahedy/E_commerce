import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerc/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerc/features/cart/cubit/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core/resources/assets_manager.dart';
import '../../../core/core/resources/color_manager.dart';
import '../../../core/core/resources/styles_manager.dart';
import '../../../core/core/resources/values_manager.dart';
import '../../../core/core/routes_manager/routes.dart';
import '../../../core/core/widget/product_counter.dart';
import '../../product_details/presentation/screen/product_details.dart';
import 'color_and_size_cart_item.dart';

class CartItemWidget extends StatelessWidget {
  GetProductsCartEntity getProductsCartEntity;

  CartItemWidget({super.key, required this.getProductsCartEntity});

  @override
  Widget build(BuildContext context) {
    // bool isPortrait =
    //     MediaQuery.of(context).orientation == Orientation.portrait;
    // var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return Container(
      height: 113.h,
      width: 398.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: ColorManager.primary,width: 1.w),
      ),
      child: Row(children: [
        // display image in the container
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: ColorManager.primary,),
          ),
          child:  CachedNetworkImage(
            imageUrl: getProductsCartEntity.product?.imageCover ?? '',
            height: 113.h,
            width: 120.w,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        // SizedBox(width: 8.w),
        // display details product=========================
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p8.w,
              vertical: AppPadding.p8.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // title and delete button ==
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        getProductsCartEntity.product?.title ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: getBoldStyle(
                          color: ColorManager.textColor,
                          fontSize: AppSize.s18.sp,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // todo : delete item
                        CartViewModel.get(context).deleteItemInCart(getProductsCartEntity.product?.id ?? "");
                      },
                      child: Image.asset(
                        IconsAssets.icDelete,
                        color: ColorManager.textColor,
                        height: 22.h,
                      ),
                    )
                  ],
                ),

                // SizedBox(height: 7.h),
                const Spacer(),

                // display price and quantity =================
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'EGP ${getProductsCartEntity.price}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: getBoldStyle(
                            color: ColorManager.textColor,
                            fontSize: AppSize.s18.sp),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: BorderRadius.circular(24.r)),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 7.h),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              // todo: decrement count
                              int count = getProductsCartEntity.count!.toInt();
                              count--;
                              CartViewModel.get(context).updateCountInCart(
                                  getProductsCartEntity.product?.id ?? "",
                                  count);
                            },
                            child: Icon(
                              Icons.remove_circle_outline,
                              size: 20.w,
                              color: ColorManager.white,
                            ),
                          ),
                          SizedBox(
                            width: 18.w,
                          ),
                          Text(
                            '${getProductsCartEntity.count}',
                            style: getMediumStyle(
                                color: ColorManager.white, fontSize: 18.sp),
                          ),
                          SizedBox(
                            width: 18.w,
                          ),
                          InkWell(
                            onTap:(){
                              // todo: increment count
                              int count = getProductsCartEntity.count!.toInt();
                              count++;
                              CartViewModel.get(context).updateCountInCart(
                                  getProductsCartEntity.product?.id ?? "",
                                  count);
                            },
                            child: Icon(Icons.add_circle_outline,
                            color: ColorManager.white,size: 20.w,),
                          )
                        ],
                      ),
                    )
                    // ProductCounter(
                    //   add: onIncrementTap,
                    //   productCounter: quantity,
                    //   remove: onDecrementTap,
                    // )
                  ],
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
