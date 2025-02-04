import 'package:e_commerc/core/core/resources/color_manager.dart';
import 'package:e_commerc/features/product_details/presentation/screen/product_details.dart';
import 'package:e_commerc/features/products_screen/presentation/cubit/products_states.dart';
import 'package:e_commerc/features/products_screen/presentation/cubit/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/core/resources/assets_manager.dart';
import '../../../../core/core/resources/font_manager.dart';
import '../../../../core/core/resources/styles_manager.dart';
import '../../../../core/core/resources/values_manager.dart';
import '../../../../core/core/routes_manager/routes.dart';
import '../../../../core/core/widget/home_screen_app_bar.dart';
import '../widgets/custom_product_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = ProductsViewModel.get(context);

    return BlocBuilder<ProductsViewModel, ProductsStates>(
      bloc: bloc..getAllProducts(),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            surfaceTintColor: Colors.white,
            automaticallyImplyLeading: true,
            title: SvgPicture.asset(
              SvgAssets.routeLogo,
              height: 25.h,
              width: 25.w,
              colorFilter:
              const ColorFilter.mode(ColorManager.textColor,
                  BlendMode.srcIn),
            ),
            bottom: PreferredSize(
                preferredSize: const Size(AppSize.s100, AppSize.s60),
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          cursorColor: ColorManager.primary,
                          style: getRegularStyle(
                              color: ColorManager.primary, fontSize: FontSize.s16),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: AppMargin.m12.w,
                                vertical: AppMargin.m8.h),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10000),
                                borderSide: BorderSide(
                                    width: AppSize.s1, color: ColorManager.primary)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10000),
                                borderSide: BorderSide(
                                    width: AppSize.s1, color: ColorManager.primary)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10000),
                                borderSide: BorderSide(
                                    width: AppSize.s1, color: ColorManager.primary)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10000),
                                borderSide: BorderSide(
                                    width: AppSize.s1, color: ColorManager.primary)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10000),
                                borderSide: BorderSide(
                                    width: AppSize.s1, color: ColorManager.error)),
                            prefixIcon: ImageIcon(
                              AssetImage(IconsAssets.icSearch),
                              color: ColorManager.primary,
                            ),
                            hintText: "what do you search for?",
                            hintStyle: getRegularStyle(
                                color: ColorManager.primary, fontSize: FontSize.s16),
                          ),
                        ),
                      ),
                      Badge(
                        alignment: Alignment.topCenter,
                        label: Text("${bloc.numOfCartItems}"),
                        child: IconButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, Routes.cartRoute),
                            icon: ImageIcon(
                              AssetImage(IconsAssets.icCart),
                              color: ColorManager.primary,
                            )),
                      )
                    ],
                  ),
                )),
            // leading: const SizedBox.shrink(),
          ),
          body: bloc.productsList.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(AppPadding.p16),
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          itemCount: bloc.productsList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 7 / 9,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                  ProductDetails(product: bloc.productsList[index])));
                                },
                                child: CustomProductWidget(
                                    product: bloc.productsList[index]));
                          },
                          scrollDirection: Axis.vertical,
                        ),
                      )
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  ),
                ),
        );
      },
    );
  }

}
