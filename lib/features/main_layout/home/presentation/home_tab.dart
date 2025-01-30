import 'package:e_commerc/core/core/widget/dialog_utils.dart';
import 'package:e_commerc/features/main_layout/home/cubit/home_tab_states.dart';
import 'package:e_commerc/features/main_layout/home/cubit/home_tab_view_model.dart';
import 'package:e_commerc/features/main_layout/home/presentation/widgets/announcement_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/custom_brand_widget.dart';
import 'widgets/custom_category_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTabViewModel, HomeTabStates>(
      bloc: HomeTabViewModel.get(context)
        ..getAllCategory()
        ..getAllBrands(),
      listener: (context, state) {
        if (state is HomeCategoryErrorState) {
          DialogUtils.showMessage(
              context: context, message: state.failures.errorMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                AnnouncementWidget(),
                Column(
                  children: [
                    CustomSectionBar(
                        sectionNname: 'Categories', function: () {}),
                    SizedBox(
                      height: 270.h,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryOrBrandsItemsWidget(
                              listCategory: HomeTabViewModel.get(context)
                                  .categoriesList[index]);
                        },
                        itemCount:
                            HomeTabViewModel.get(context).categoriesList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                      ),
                    )
                    // Center(
                    //    child: CircularProgressIndicator(
                    //    color: ColorManager.primary,
                    //  )),
                    ,
                    SizedBox(height: 12.h),
                    CustomSectionBar(sectionNname: 'Brands', function: () {}),
                    SizedBox(
                      height: 270.h,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CustomBrandWidget(
                            listBrands:
                                HomeTabViewModel.get(context).brandsList[index],
                          );
                        },
                        itemCount:
                            HomeTabViewModel.get(context).brandsList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                      ),
                    )
                    // : Center(child: CircularProgressIndicator(color: ColorManager.primary,)),

                    // CustomSectionBar(
                    //   sectionNname: 'Most Selling Products',
                    //   function: () {},
                    // ),
                    // SizedBox(
                    //   child: SizedBox(
                    //     height: 360.h,
                    //     child: ListView.builder(
                    //       scrollDirection: Axis.horizontal,
                    //       itemBuilder: (context, index) {
                    //         return const ProductCard(
                    //           title: "Nike Air Jordon",
                    //           description:
                    //               "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories",
                    //           rating: 4.5,
                    //           price: 1100,
                    //           priceBeforeDiscound: 1500,
                    //           image: ImageAssets.categoryHomeImage,
                    //         );
                    //       },
                    //       itemCount: 20,
                    //     ),
                    //   ),
                    // ),
                    ,
                    SizedBox(height: 12.h),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
