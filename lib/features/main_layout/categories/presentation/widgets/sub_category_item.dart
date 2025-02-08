import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerc/core/core/resources/assets_manager.dart';
import 'package:e_commerc/features/main_layout/categories/cubit/category_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/core/resources/color_manager.dart';
import '../../../../../core/core/resources/styles_manager.dart';
import '../../../../../core/core/resources/values_manager.dart';
import '../../../../../core/core/routes_manager/routes.dart';



class SubCategoryItem extends StatelessWidget {
  final String title;
  final String image;
  final Function navigation;
  const SubCategoryItem(this.title, this.image, this.navigation, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, Routes.productsScreenRoute,
            arguments:CategoryTabViewModel.get(context).selectedCategory );
      }
      ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                  border: Border.all(color: ColorManager.primary, width: 2)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s10),
                child: CachedNetworkImage(
                  height: 70.h,
                  width: 100.w,
                  fit: BoxFit.fill,
                  imageUrl: image,
                  placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                  Center(child: Image.asset(ImageAssets.categoryHomeImage,
                    fit: BoxFit.cover,
                  height: double.infinity,),),
                  // const Center(child: Icon(Icons.error)),
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: getRegularStyle(color: ColorManager.primary),
            ),
          )
        ],
      ),
    );
  }
}
