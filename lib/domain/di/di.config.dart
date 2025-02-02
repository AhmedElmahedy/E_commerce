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
import '../../data/data_sources/remote_data_source/auth_remote_data_source.dart'
    as _i45;
import '../../data/data_sources/remote_data_source/home_remote_data_source.dart'
    as _i579;
import '../../data/data_sources/remote_data_source/remote_data_source_impl/auth_remote_data_source_impl.dart'
    as _i846;
import '../../data/data_sources/remote_data_source/remote_data_source_impl/home_remote_data_source_impl.dart'
    as _i576;
import '../../data/repository/auth_repository_impl.dart' as _i581;
import '../../data/repository/home_repository_impl.dart' as _i1043;
import '../../features/auth.presentation.screens/login/cubit/login_view_model.dart'
    as _i1009;
import '../../features/auth.presentation.screens/register/cubit/register_view_model.dart'
    as _i150;
import '../../features/main_layout/home/cubit/home_tab_view_model.dart'
    as _i222;
import '../../features/products_screen/presentation/cubit/products_view_model.dart'
    as _i494;
import '../repository/auth_repository.dart' as _i106;
import '../repository/home_repository.dart' as _i326;
import '../use_cases/get_all_brands_use_case.dart' as _i59;
import '../use_cases/get_all_category_use_case.dart' as _i1069;
import '../use_cases/get_all_products_use_case.dart' as _i564;
import '../use_cases/login_use_case.dart' as _i119;
import '../use_cases/register_use_case.dart' as _i526;

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
    gh.factory<_i579.HomeRemoteDataSource>(() =>
        _i576.HomeRemoteDataSourceImpl(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i45.AuthRemoteDataSource>(() =>
        _i846.AuthRemoteDataSourceImpl(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i326.HomeRepository>(() => _i1043.HomeRepositoryImpl(
        homeRemoteDataSource: gh<_i579.HomeRemoteDataSource>()));
    gh.factory<_i106.AuthRepository>(() => _i581.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i45.AuthRemoteDataSource>()));
    gh.factory<_i1069.GetAllCategoryUseCase>(() => _i1069.GetAllCategoryUseCase(
        homeRepository: gh<_i326.HomeRepository>()));
    gh.factory<_i59.GetAllBrandsUseCase>(() =>
        _i59.GetAllBrandsUseCase(homeRepository: gh<_i326.HomeRepository>()));
    gh.factory<_i564.GetAllProductsUseCase>(() => _i564.GetAllProductsUseCase(
        homeRepository: gh<_i326.HomeRepository>()));
    gh.factory<_i119.LoginUseCase>(
        () => _i119.LoginUseCase(authRepository: gh<_i106.AuthRepository>()));
    gh.factory<_i526.RegisterUseCase>(() =>
        _i526.RegisterUseCase(authRepository: gh<_i106.AuthRepository>()));
    gh.factory<_i150.RegisterViewModel>(() =>
        _i150.RegisterViewModel(registerUseCase: gh<_i526.RegisterUseCase>()));
    gh.factory<_i494.ProductsViewModel>(() => _i494.ProductsViewModel(
        getAllProductsUseCase: gh<_i564.GetAllProductsUseCase>()));
    gh.factory<_i222.HomeTabViewModel>(() => _i222.HomeTabViewModel(
          getAllCategoryUseCase: gh<_i1069.GetAllCategoryUseCase>(),
          getAllBrandsUseCase: gh<_i59.GetAllBrandsUseCase>(),
        ));
    gh.factory<_i1009.LoginViewModel>(
        () => _i1009.LoginViewModel(loginUseCase: gh<_i119.LoginUseCase>()));
    return this;
  }
}
