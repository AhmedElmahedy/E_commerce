import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerc/data/api_manager.dart';
import 'package:e_commerc/data/end_point.dart';
import 'package:e_commerc/data/model/GetSubCategoriesResponseDto.dart';
import 'package:e_commerc/domain/failures.dart';
import 'package:injectable/injectable.dart';

import '../remote_data_source/get_sub_categories_remote_data_source.dart';

@Injectable(as: GetSubCategoriesRemoteDataSource )
class GetSubCategoriesRemoteDataSourceImpl implements GetSubCategoriesRemoteDataSource {
  ApiManager apiManager;
  GetSubCategoriesRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, GetSubCategoriesResponseDto>> getSubCategories(String id)async {
    // TODO: implement getSubCategories
    try{
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var response = await apiManager.getData(EndPoint.subcategory(id));
        var getSubCategoriesResponse = GetSubCategoriesResponseDto.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getSubCategoriesResponse);
        } else {
          return Left(ServerError(errorMessage: getSubCategoriesResponse.message!));
        }
      } else {
        // No internet
        return Left(NetworkError(
            errorMessage: 'No Internet Connection , Please Check Internet'));
      }
    }catch(e){
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}