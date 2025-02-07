import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerc/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CustomBrandWidget extends StatelessWidget {
  CategoryOrBrandDataEntity listBrands ;
   CustomBrandWidget({super.key ,required this.listBrands});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        CachedNetworkImage(
          height: 80.h,
          width: 80.w,
          fit: BoxFit.cover,
          imageUrl: listBrands.image ?? '',
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
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

        // ClipRRect(
        //   borderRadius: BorderRadius.circular(100.r),
        //   child: Container(
        //     height: 100.h,
        //     width: 100.w,
        //     decoration: const BoxDecoration(
        //       shape: BoxShape.circle,
        //     ),
        //     child: Image.asset(
        //       ImageAssets.brandHomeImage,
        //       fit: BoxFit.scaleDown,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

