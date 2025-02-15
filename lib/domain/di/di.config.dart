// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/api_manager.dart' as _i236;
import '../../data/data_sources/remote/remote_data_source/auth_remote_data_source.dart'
    as _i387;
import '../../data/data_sources/remote/remote_data_source/get_cart_remote_data_source.dart'
    as _i569;
import '../../data/data_sources/remote/remote_data_source/get_products_remote_data_source.dart'
    as _i618;
import '../../data/data_sources/remote/remote_data_source/get_sub_categories_remote_data_source.dart'
    as _i642;
import '../../data/data_sources/remote/remote_data_source/home_remote_data_source.dart'
    as _i396;
import '../../data/data_sources/remote/remote_data_source_impl/auth_remote_data_source_impl.dart'
    as _i338;
import '../../data/data_sources/remote/remote_data_source_impl/get_cart_remote_data_source_impl.dart'
    as _i941;
import '../../data/data_sources/remote/remote_data_source_impl/get_products_remote_data_source_impl.dart'
    as _i45;
import '../../data/data_sources/remote/remote_data_source_impl/get_sub_categories_remote_data_source_impl.dart'
    as _i486;
import '../../data/data_sources/remote/remote_data_source_impl/home_remote_data_source_impl.dart'
    as _i172;
import '../../data/repository/auth_repository_impl.dart' as _i581;
import '../../data/repository/get_cart_repository_impl.dart' as _i590;
import '../../data/repository/get_products_repository_impl.dart' as _i902;
import '../../data/repository/get_sub_categories_repository_impl.dart' as _i355;
import '../../data/repository/home_repository_impl.dart' as _i1043;
import '../../features/auth.presentation.screens/login/cubit/login_view_model.dart'
    as _i1009;
import '../../features/auth.presentation.screens/register/cubit/register_view_model.dart'
    as _i150;
import '../../features/cart/cubit/cart_view_model.dart' as _i70;
import '../../features/main_layout/categories/cubit/category_tab_view_model.dart'
    as _i607;
import '../../features/main_layout/favourite/cubit/favourite_view_model.dart'
    as _i489;
import '../../features/main_layout/home/cubit/home_tab_view_model.dart'
    as _i222;
import '../../features/products_screen/presentation/cubit/products_view_model.dart'
    as _i494;
import '../repository/auth_repository.dart' as _i106;
import '../repository/get_cart_repository.dart' as _i709;
import '../repository/get_products_repository.dart' as _i210;
import '../repository/get_sub_categories_repository.dart' as _i1055;
import '../repository/home_repository.dart' as _i326;
import '../use_cases/add_products_wishlist_use_case.dart' as _i617;
import '../use_cases/add_to_cart_use_case.dart' as _i661;
import '../use_cases/delete_item_in_cart_use_case.dart' as _i723;
import '../use_cases/get_all_brands_use_case.dart' as _i59;
import '../use_cases/get_all_category_use_case.dart' as _i1069;
import '../use_cases/get_cart_use_case.dart' as _i220;
import '../use_cases/get_products_use_case.dart' as _i109;
import '../use_cases/get_products_wishlist_use_case.dart' as _i806;
import '../use_cases/get_sub_categories_use_case.dart' as _i817;
import '../use_cases/login_use_case.dart' as _i119;
import '../use_cases/register_use_case.dart' as _i526;
import '../use_cases/update_count_in_cart_use_case.dart' as _i786;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i236.ApiManager>(() => _i236.ApiManager());
    gh.factory<_i396.HomeRemoteDataSource>(() =>
        _i172.HomeRemoteDataSourceImpl(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i387.AuthRemoteDataSource>(() =>
        _i338.AuthRemoteDataSourceImpl(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i569.GetCartRemoteDataSource>(() =>
        _i941.GetCartRemoteDataSourceImpl(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i642.GetSubCategoriesRemoteDataSource>(() =>
        _i486.GetSubCategoriesRemoteDataSourceImpl(
            apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i618.GetProductsRemoteDataSource>(() =>
        _i45.GetProductsRemoteDataSourceImpl(
            apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i709.GetCartRepository>(() => _i590.GetCartRepositoryImpl(
        getCartRemoteDataSource: gh<_i569.GetCartRemoteDataSource>()));
    gh.factory<_i326.HomeRepository>(() => _i1043.HomeRepositoryImpl(
        homeRemoteDataSource: gh<_i396.HomeRemoteDataSource>()));
    gh.factory<_i220.GetCartUseCase>(() =>
        _i220.GetCartUseCase(getCartRepository: gh<_i709.GetCartRepository>()));
    gh.factory<_i723.DeleteItemInCartUseCase>(() =>
        _i723.DeleteItemInCartUseCase(
            getCartRepository: gh<_i709.GetCartRepository>()));
    gh.factory<_i786.UpdateCountItemInCartUseCase>(() =>
        _i786.UpdateCountItemInCartUseCase(
            getCartRepository: gh<_i709.GetCartRepository>()));
    gh.factory<_i210.GetProductsRepository>(() =>
        _i902.GetProductsRepositoryImpl(
            getProductsRemoteDataSource:
                gh<_i618.GetProductsRemoteDataSource>()));
    gh.factory<_i1055.GetSubCategoriesRepository>(() =>
        _i355.GetSubCategoriesRepositoryImpl(
            getSubCategoriesRemoteDataSource:
                gh<_i642.GetSubCategoriesRemoteDataSource>()));
    gh.factory<_i817.GetSubCategoriesUseCase>(() =>
        _i817.GetSubCategoriesUseCase(
            getSubCategoriesRepository:
                gh<_i1055.GetSubCategoriesRepository>()));
    gh.factory<_i106.AuthRepository>(() => _i581.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i387.AuthRemoteDataSource>()));
    gh.factory<_i109.GetProductsUseCase>(() => _i109.GetProductsUseCase(
        getProductsRepository: gh<_i210.GetProductsRepository>()));
    gh.factory<_i617.AddProductsWishlistUseCase>(() =>
        _i617.AddProductsWishlistUseCase(
            getProductsRepository: gh<_i210.GetProductsRepository>()));
    gh.factory<_i806.GetProductsWishlistUseCase>(() =>
        _i806.GetProductsWishlistUseCase(
            getProductsRepository: gh<_i210.GetProductsRepository>()));
    gh.factory<_i661.AddToCartUseCase>(() =>
        _i661.AddToCartUseCase(homeRepository: gh<_i326.HomeRepository>()));
    gh.factory<_i59.GetAllBrandsUseCase>(() =>
        _i59.GetAllBrandsUseCase(homeRepository: gh<_i326.HomeRepository>()));
    gh.factory<_i1069.GetAllCategoryUseCase>(() => _i1069.GetAllCategoryUseCase(
        homeRepository: gh<_i326.HomeRepository>()));
    gh.factory<_i70.CartViewModel>(() => _i70.CartViewModel(
          getCartUseCase: gh<_i220.GetCartUseCase>(),
          deleteItemInCartUseCase: gh<_i723.DeleteItemInCartUseCase>(),
          updateCount: gh<_i786.UpdateCountItemInCartUseCase>(),
        ));
    gh.factory<_i119.LoginUseCase>(
        () => _i119.LoginUseCase(authRepository: gh<_i106.AuthRepository>()));
    gh.factory<_i526.RegisterUseCase>(() =>
        _i526.RegisterUseCase(authRepository: gh<_i106.AuthRepository>()));
    gh.factory<_i607.CategoryTabViewModel>(() => _i607.CategoryTabViewModel(
          getAllCategoryUseCase: gh<_i1069.GetAllCategoryUseCase>(),
          getSubCategoriesUseCase: gh<_i817.GetSubCategoriesUseCase>(),
        ));
    gh.factory<_i150.RegisterViewModel>(() =>
        _i150.RegisterViewModel(registerUseCase: gh<_i526.RegisterUseCase>()));
    gh.factory<_i489.FavouriteViewModel>(() => _i489.FavouriteViewModel(
        getProductsWishlistUseCase: gh<_i806.GetProductsWishlistUseCase>()));
    gh.factory<_i222.HomeTabViewModel>(() => _i222.HomeTabViewModel(
          getAllCategoryUseCase: gh<_i1069.GetAllCategoryUseCase>(),
          getAllBrandsUseCase: gh<_i59.GetAllBrandsUseCase>(),
        ));
    gh.factory<_i494.ProductsViewModel>(() => _i494.ProductsViewModel(
          getProductsUseCase: gh<_i109.GetProductsUseCase>(),
          addToCartUseCase: gh<_i661.AddToCartUseCase>(),
          addProductsWishlistUseCase: gh<_i617.AddProductsWishlistUseCase>(),
        ));
    gh.factory<_i1009.LoginViewModel>(
        () => _i1009.LoginViewModel(loginUseCase: gh<_i119.LoginUseCase>()));
    return this;
  }
}
