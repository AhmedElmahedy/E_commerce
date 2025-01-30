import 'package:e_commerc/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerc/domain/failures.dart';

abstract class RegisterStates {}
class RegisterInitialState extends RegisterStates {}
class RegisterLoadingState extends RegisterStates {}
class RegisterErrorState extends RegisterStates {
  Failures failures ;
  RegisterErrorState({required this.failures});
}
class RegisterSuccessState extends RegisterStates {
  RegisterResponseEntity registerResponseEntity;
  RegisterSuccessState({required this.registerResponseEntity});
}