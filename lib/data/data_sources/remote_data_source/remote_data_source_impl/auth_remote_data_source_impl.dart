import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerc/data/api_manager.dart';
import 'package:e_commerc/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:e_commerc/data/end_point.dart';
import 'package:e_commerc/data/model/LoginResponseDto.dart';
import 'package:e_commerc/data/model/RegisterResponseDto.dart';
import 'package:e_commerc/domain/failures.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, RegisterResponseDto>> register(String name,
      String email, String password, String rePassword, String phone) async {
    // TODO: implement register
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var response = await apiManager.postData(EndPoint.register, body: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": phone
        });
        var registerResponse = RegisterResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerResponse);
        } else {
          return Left(ServerError(errorMessage: registerResponse.message!));
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
  Future<Either<Failures, LoginResponseDto>> login(
      String email, String password) async {
    // TODO: implement login
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.mobile ||
          checkResult == ConnectivityResult.wifi) {
        var response = await apiManager.postData(EndPoint.login,
            body: {"email": email, "password": password});
        var loginResponse = LoginResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(loginResponse);
        } else {
          return Left(ServerError(errorMessage: loginResponse.message!));
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
}
