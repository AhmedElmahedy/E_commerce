import 'package:e_commerc/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerc/features/main_layout/categories/cubit/category_tab_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/core/resources/color_manager.dart';
import '../../../../../core/core/resources/values_manager.dart';
import '../../cubit/category_tab_view_model.dart';
import 'category_item.dart';

class CategoriesList extends StatefulWidget {
  List<CategoryOrBrandDataEntity> dataEntity;
  CategoriesList({required this.dataEntity});
  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.containerGray,
          border: Border(
              // set the border for only 3 sides
              top: BorderSide(
                  width: AppSize.s2.w,
                  color: ColorManager.primary.withOpacity(0.3)),
              left: BorderSide(
                  width: AppSize.s2.w,
                  color: ColorManager.primary.withOpacity(0.3)),
              bottom: BorderSide(
                  width: AppSize.s2.w,
                  color: ColorManager.primary.withOpacity(0.3))),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.s12.r),
            bottomLeft: Radius.circular(AppSize.s12.r),
          ),
        ),

        // the categories items list
        child: ClipRRect(
          // clip the corners of the container that hold the list view
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.s12.r),
            bottomLeft: Radius.circular(AppSize.s120.r),
          ),
          child: ListView.builder(
            itemCount: widget.dataEntity.length,
            itemBuilder: (context, index) => CategoryItem(
                index: index,
                title: '${widget.dataEntity[index].name}',
                isSelected: selectedIndex == index,
                onItemClick: onItemClick),
          ),
        ),
      ),
    );
  }

  onItemClick(int index) {
    setState(() {
      selectedIndex = index;
      CategoryTabViewModel.get(context).chanageCategory(widget.dataEntity[selectedIndex]);
    });
  }
}
