import 'package:e_commerc/core/core/resources/color_manager.dart';
import 'package:e_commerc/core/core/widget/dialog_utils.dart';
import 'package:e_commerc/domain/di/di.dart';
import 'package:e_commerc/features/main_layout/favourite/cubit/favourite_states.dart';
import 'package:e_commerc/features/main_layout/favourite/cubit/favourite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/core/resources/constants_manager.dart';
import '../../../../../core/core/resources/values_manager.dart';
import '../../../../product_details/presentation/screen/product_details.dart';
import '../widgets/favourite_item.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FavouriteViewModel>()..getProductsWishlist(),
      child: BlocBuilder<FavouriteViewModel, FavouriteStates>(
        builder: (context, state) {
          if (state is FavouriteErrorState) {
            return Center(child: Text(state.failures.errorMessage));
          }
          if (state is FavouriteSuccessState) {
            return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize.s14.w, vertical: AppSize.s10.h),
                child: ListView.builder(
                  itemCount: state.productResponseEntity.data?.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) {
                                      return ProductDetails(
                                          product: state.productResponseEntity.data![index] );
                                    }
                                ));
                          },
                        child: FavoriteItem(
                            product: state.productResponseEntity.data![index]),
                      ),
                    );
                  },
                ));
          }

          return Center(
            child: CircularProgressIndicator(
              color: ColorManager.primary,
            ),
          );
        },
      ),
    );
  }
}
