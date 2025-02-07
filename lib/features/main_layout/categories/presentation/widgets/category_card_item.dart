import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/core/resources/assets_manager.dart';
import '../../../../../core/core/resources/color_manager.dart';
import '../../../../../core/core/resources/font_manager.dart';
import '../../../../../core/core/resources/styles_manager.dart';
import '../../../../../core/core/resources/values_manager.dart';

class CategoryCardItem extends StatelessWidget {
  final String title;
  final String image;
  final Function navigation;

  const CategoryCardItem(this.title, this.image, this.navigation, {super.key});

  @override
  Widget build(BuildContext context) {
    // Create a container for the category card
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppSize.s4),
      // Height of the card set with fixed size to make all image same size but it can be deleted without affecting the code
      height: AppSize.s120.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSize.s12),
        child: Stack(
          children: [
            // Background image for the category
            CachedNetworkImage(
              imageUrl: image,
              width: double.infinity,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Center(
                child: Image.asset(
                  ImageAssets.categoryHomeImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            // Overlay with category title and button
            Positioned.fill(
                child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p18, vertical: AppMargin.m8),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Category title
                      Text(
                        title,
                        style: getBoldStyle(
                            color: ColorManager.textColor,
                            fontSize: FontSize.s16.sp),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // Shop Now button
                      SizedBox(
                        width: 110.w,
                        height: 35.h,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(120.w, 30.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 0),
                                backgroundColor: ColorManager.primary,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r))),
                            child: Text(
                              "Shop Now",
                              style: getRegularStyle(color: ColorManager.white),
                            )),
                      )
                    ],
                  )),
                  const Spacer()
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
