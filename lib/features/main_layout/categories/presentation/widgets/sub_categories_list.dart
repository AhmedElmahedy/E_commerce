import 'package:e_commerc/features/main_layout/categories/cubit/category_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core/resources/color_manager.dart';
import '../../../../../core/core/resources/font_manager.dart';
import '../../../../../core/core/resources/styles_manager.dart';
import '../../../../../core/core/resources/values_manager.dart';
import '../../cubit/category_tab_states.dart';
import 'category_card_item.dart';
import 'sub_category_item.dart';

class SubCategoriesList extends StatelessWidget {
  const SubCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: BlocBuilder<CategoryTabViewModel, CategoryTabStates>(
        buildWhen: (previous, current) {
          if (current is ChangeNewCategoryState) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          return CustomScrollView(
            slivers: <Widget>[
              // category title
              SliverToBoxAdapter(
                child: Text(
                  '${CategoryTabViewModel.get(context).selectedCategory?.name}',
                  style: getBoldStyle(
                      color: ColorManager.primary, fontSize: FontSize.s14),
                ),
              ),
              // the category card
              SliverToBoxAdapter(
                child: CategoryCardItem(
                    "${CategoryTabViewModel.get(context).selectedCategory?.name}",
                    CategoryTabViewModel.get(context).selectedCategory?.image ??
                        "",
                    goToCategoryProductsListScreen),
              ),
              // the grid view of the subcategories
              BlocBuilder<CategoryTabViewModel, CategoryTabStates>(
                buildWhen: (previous, current) {
                  if (current is GetSubCategoriesSuccessState ||
                      current is GetSubCategoriesErrorState ||
                      current is GetSUbCategoriesLoadingState) {
                    return true;
                  }
                  return false;
                },
                builder: (context, state) {
                  if (state is GetSubCategoriesErrorState) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text(state.failures.errorMessage),
                      ),
                    );
                  }
                  if (state is GetSubCategoriesSuccessState) {
                    return SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          childCount:
                              state.getSubCategoriesResponseEntity.data?.length,
                          (context, index) => SubCategoryItem(
                              state.getSubCategoriesResponseEntity
                                      .data?[index].name ??
                                  '',
                              CategoryTabViewModel.get(context)
                                      .selectedCategory
                                      ?.image ??
                                  '',
                              goToCategoryProductsListScreen),
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1 / 2,
                          mainAxisSpacing: AppSize.s10,
                          crossAxisSpacing: AppSize.s8,
                        ));
                  }
                  return SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.primary,
                      ),
                    ),
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }

  goToCategoryProductsListScreen() {
    // todo implement this function
  }
}
