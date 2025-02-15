import 'package:dartz/dartz.dart';
import 'package:e_commerc/domain/entities/LoginResponseEntity.dart';
import 'package:e_commerc/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerc/domain/repository/auth_repository.dart';
import 'package:e_commerc/domain/failures.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/remote/remote_data_source/auth_remote_data_source.dart';

@Injectable(as: AuthRepository)

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone) async {
    // TODO: implement register
    var either = await authRemoteDataSource.register(
        name, email, password, rePassword, phone);
    return either.fold((error) => left(error), (response) => right(response));
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password) async {
    // TODO: implement login
    var either = await authRemoteDataSource.login(email, password);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
