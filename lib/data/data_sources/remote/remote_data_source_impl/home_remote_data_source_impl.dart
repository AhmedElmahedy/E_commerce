import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerc/core/core/widget/hive_preference_util.dart';
import 'package:e_commerc/data/api_manager.dart';
import 'package:e_commerc/data/end_point.dart';
import 'package:e_commerc/data/model/AddToCartResponseDto.dart';
import 'package:e_commerc/data/model/CategoryOrBrandsResponseDto.dart';
import 'package:e_commerc/domain/failures.dart';
import 'package:injectable/injectable.dart';

import '../remote_data_source/home_remote_data_source.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoriesOrBrandsResponseDto>>
      getAllCategories() async {
    // TODO: implement getAllCategories
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var response = await apiManager.getData(EndPoint.getAllCategory);
        var getAllCategoryResponse =
            CategoriesOrBrandsResponseDto.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getAllCategoryResponse);
        } else {
          return Left(
              ServerError(errorMessage: getAllCategoryResponse.message!));
        }
      } else {
        // No internet
        return Left(NetworkError(
            errorMessage: 'No Internet Connection , Please Check Internet'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoriesOrBrandsResponseDto>> getAllBrands() async {
    // TODO: implement getAllBrands
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var response = await apiManager.getData(EndPoint.getAllBrands);
        var getAllBrandsResponse =
            CategoriesOrBrandsResponseDto.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getAllBrandsResponse);
        } else {
          return Left(ServerError(errorMessage: getAllBrandsResponse.message!));
        }
      } else {
        // No internet
        return Left(NetworkError(
            errorMessage: 'No Internet Connection , Please Check Internet'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }




  @override
Future<Either<Failures, AddToCartResponseDto>> addToCart(String productId) async {
  // TODO: implement addToCart
  try {
    var checkResult = await Connectivity().checkConnectivity();
    if (checkResult == ConnectivityResult.wifi ||
        checkResult == ConnectivityResult.mobile) {

      var token = await HivePreferenceUtil.getData() ;
      if (token == null ){
        return left((Failures(errorMessage: "User is not authenticated")));
      }
      print("Token : $token");
      var response = await apiManager.postData(EndPoint.addToCart,
          body: {"productId": productId},
          headers: {'token': token});
      var addToCartResponse = AddToCartResponseDto.fromJson(response.data);

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(addToCartResponse);
      } else {
        return Left(ServerError(errorMessage: addToCartResponse.message!));
      }
    } else {
      // No internet
      return Left(NetworkError(
          errorMessage: 'No Internet Connection , Please Check Internet'));
    }
  } catch (e) {
    return Left(Failures(errorMessage: e.toString()));
  }
}

  // Future<Either<Failures, AddToCartResponseDto>> addToCart(String productId) async {
  //   try {
  //     var checkResult = await Connectivity().checkConnectivity();
  //     print("🔍 حالة الاتصال بالإنترنت: $checkResult");
  //
  //     if (checkResult != ConnectivityResult.wifi &&
  //         checkResult != ConnectivityResult.mobile) {
  //       return Left(NetworkError(
  //           errorMessage: '❌ لا يوجد اتصال بالإنترنت، تحقق من الشبكة'));
  //     }
  //
  //     var token = await HivePreferenceUtil.getData(key: 'token');
  //     print("🔍 التوكن المسترجع: $token");
  //
  //     if (token == null) {
  //       return Left(Failures(errorMessage: "❌ المستخدم غير مسجل الدخول"));
  //     }
  //
  //     print("✅ التوكن صحيح، يتم إرسال الطلب إلى API...");
  //
  //     var response = await apiManager.postData(
  //       EndPoint.addToCart,
  //       body: {"productId": productId},
  //       headers: {'token': token},
  //     );
  //
  //     print(
  //         "🔍 استجابة API: ${response.statusCode}, البيانات: ${response.data}");
  //
  //     var addToCartResponse = AddToCartResponseDto.fromJson(response.data);
  //
  //     if (response.statusCode! >= 200 && response.statusCode! < 300) {
  //       print("✅ المنتج أُضيف بنجاح إلى السلة");
  //       return Right(addToCartResponse);
  //     } else {
  //       print("❌ خطأ في API: ${addToCartResponse.message}");
  //       return Left(ServerError(errorMessage: addToCartResponse.message!));
  //     }
  //   } catch (e) {
  //     print("❌ استثناء تم التقاطه: $e");
  //     return Left(Failures(errorMessage: e.toString()));
  //   }
  // }


}
