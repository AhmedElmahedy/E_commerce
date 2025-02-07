import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerc/core/core/resources/assets_manager.dart';
import 'package:e_commerc/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/core/resources/color_manager.dart';
import '../../../../../core/core/resources/styles_manager.dart';


class CategoryOrBrandsItemsWidget extends StatelessWidget {
  CategoryOrBrandDataEntity listCategory;
   CategoryOrBrandsItemsWidget({super.key, required this.listCategory});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          height: 70.h,
          width: 100.w,
          fit: BoxFit.cover,
          imageUrl: listCategory.image ?? "",
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              Container(
                height: 70.h,
                width: 70.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(ImageAssets.categoryHomeImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),


        SizedBox(height: 7.h),
        Text(
          listCategory.name ?? "",
          textAlign: TextAlign.center,
          style: getRegularStyle(color: ColorManager.darkBlue, fontSize: 14.sp),
        ),
      ],
    );
  }
}
