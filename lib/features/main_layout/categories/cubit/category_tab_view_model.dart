import 'package:e_commerc/data/model/CategoryOrBrandsResponseDto.dart';
import 'package:e_commerc/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerc/domain/use_cases/get_all_category_use_case.dart';
import 'package:e_commerc/domain/use_cases/get_sub_categories_use_case.dart';
import 'package:e_commerc/features/main_layout/categories/cubit/category_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoryTabViewModel extends Cubit<CategoryTabStates> {
  GetAllCategoryUseCase getAllCategoryUseCase;
  GetSubCategoriesUseCase getSubCategoriesUseCase;

  CategoryTabViewModel(
      {required this.getAllCategoryUseCase,
      required this.getSubCategoriesUseCase})
      : super(GetCategoriesInitialState());

  // int selectedIndex = 0;

  List<CategoryOrBrandDataEntity> categoryList = [];

  CategoryOrBrandDataEntity? selectedCategory;

  Function(String catgoryId)? onCategorySelected;

  static CategoryTabViewModel get(context) => BlocProvider.of(context);

  //todo: hold data - handle logic
  void getCategory() async {
    var either = await getAllCategoryUseCase.invoke();
    either.fold((error) {
      emit(GetCategoriesErrorState(failures: error));
    }, (response) {
      selectedCategory = response.data![0];
      categoryList = response.data ?? [];
      getSubCategories();
      print(categoryList);
      emit(GetCategoriesSuccessState(
          categoriesOrBrandsResponseEntity: response));
    });
  }

  chanageCategory(CategoryOrBrandDataEntity newCategory) {
    selectedCategory = newCategory;
    getSubCategories();
    emit(ChangeNewCategoryState());
  }

  getSubCategories() async {
    emit(GetSUbCategoriesLoadingState());
    var either =
        await getSubCategoriesUseCase.invoke(selectedCategory?.id ?? '');
    either.fold((error) {
      emit(GetSubCategoriesErrorState(failures: error));
    }, (response) {
      emit(GetSubCategoriesSuccessState(
          getSubCategoriesResponseEntity: response));
    });
  }

// void onClickItem(int index) {
//   selectedIndex = index;
//   print("selectedIndex : $selectedIndex");
//
//   if(onCategorySelected != null){
//     onCategorySelected!(categoryList[index].id ?? "");
//   }
//   emit(CategorySelectedIndex(selectedIndex:index));
//
// }
}
