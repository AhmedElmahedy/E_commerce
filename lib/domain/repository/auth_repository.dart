import 'package:dartz/dartz.dart';
import 'package:e_commerc/domain/entities/LoginResponseEntity.dart';
import 'package:e_commerc/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerc/domain/failures.dart';


abstract class AuthRepository {
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone);

  Future<Either<Failures, LoginResponseEntity>> login(
    String email,
    String password,
  );
}
