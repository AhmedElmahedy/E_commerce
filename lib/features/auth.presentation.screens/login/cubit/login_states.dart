import 'package:e_commerc/domain/entities/LoginResponseEntity.dart';

import '../../../../domain/failures.dart';

abstract class LoginStates {}
class LoginInitialState extends LoginStates {}
class LoginLoadingState extends LoginStates {}
class LoginErrorState extends LoginStates {
  Failures failures ;
  LoginErrorState({required this.failures});
}
class LoginSuccessState extends LoginStates {
  LoginResponseEntity loginResponseEntity ;
  LoginSuccessState({required this.loginResponseEntity});
}