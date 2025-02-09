import 'package:e_commerc/domain/di/di.dart';
import 'package:e_commerc/features/main_layout/categories/cubit/category_tab_states.dart';
import 'package:e_commerc/features/main_layout/categories/cubit/category_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core/resources/values_manager.dart';
import 'widgets/categories_list.dart';
import 'widgets/sub_categories_list.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoryTabViewModel>()..getCategory(),
      child: BlocBuilder<CategoryTabViewModel, CategoryTabStates>(
          buildWhen: (previous, current) {
        if (current is GetCategoriesSuccessState ||
            current is GetCategoriesErrorState ||
            current is GetCategoriesLoadingState) {
          return true;
        }
        return false;
      }, builder: (context, state) {
        if (state is GetCategoriesErrorState) {
          return Center(
            child: Text(state.failures.errorMessage),
          );
        } else if (state is GetCategoriesSuccessState) {
          return Padding(
            padding: REdgeInsets.symmetric(
                horizontal: AppPadding.p12, vertical: AppPadding.p12),
            child: Row(
              children: [
                CategoriesList(
                    dataEntity:
                        state.categoriesOrBrandsResponseEntity.data ?? []),
                SizedBox(
                  width: AppSize.s16.w,
                ),
                SubCategoriesList()
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
