import 'package:e_commerc/features/products_screen/presentation/cubit/products_states.dart';
import 'package:e_commerc/features/products_screen/presentation/cubit/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';

class HeartButton extends StatelessWidget {
  String productId;
  final void Function()? onTap;

  HeartButton({super.key, required this.onTap,required this.productId});

  String heartIcon = IconsAssets.icHeart;

  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsViewModel, ProductsStates>(
      buildWhen: (previous, current) {
        if (current is AddProductWishlistSuccessState ||
            current is AddProductWishlistErrorState ||
            current is AddProductWishlistLoadingState) {
          return true;
        }
        return false;
      },
      listenWhen: (previous, current) {
        if (current is AddProductWishlistSuccessState ||
            current is AddProductWishlistErrorState ||
            current is AddProductWishlistLoadingState) {
          return true;
        }
        return false;
      },
      listener: (context, state) {},
      builder: (context, state) {
        if (state is AddProductWishlistLoadingState && state.productId == productId) {
          return Material(
            // borderRadius: BorderRadius.circular(2),
            color: ColorManager.white,
            elevation: 5,
            shape: const StadiumBorder(),
            shadowColor: ColorManager.black,
            child: Padding(
                padding: const EdgeInsets.all(6),
                child: Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  ),
                )),
          );
        }
        if (state is AddProductWishlistSuccessState && state.productId == productId) {
          return Material(
            // borderRadius: BorderRadius.circular(2),
            color: ColorManager.white,
            elevation: 5,
            shape: const StadiumBorder(),
            shadowColor: ColorManager.black,
            child: Padding(
                padding: const EdgeInsets.all(6),
                child: ImageIcon(
                  AssetImage(IconsAssets.icClickedHeart),
                  color: ColorManager.primary,
                )),
          ) ;
        }
        return InkWell(
          // radius: 25,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          onTap: () {
            onTap!();
            // setState(() {
            //   isClicked = !isClicked;
            //   heartIcon =
            //   !isClicked ? IconsAssets.icHeart : IconsAssets.icClickedHeart;
            //
            // });
          },
          child: Material(
            // borderRadius: BorderRadius.circular(2),
            color: ColorManager.white,
            elevation: 5,
            shape: const StadiumBorder(),
            shadowColor: ColorManager.black,
            child: Padding(
                padding: const EdgeInsets.all(6),
                child: ImageIcon(
                  AssetImage(IconsAssets.icHeart),
                  color: ColorManager.primary,
                )),
          ),
        );
      },
    );
  }
}
