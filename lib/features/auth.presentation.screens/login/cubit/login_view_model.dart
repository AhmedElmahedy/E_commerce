 import 'package:e_commerc/domain/use_cases/login_use_case.dart';
import 'package:e_commerc/features/auth.presentation.screens/login/cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit <LoginStates> {
  LoginUseCase loginUseCase;
  LoginViewModel({required this.loginUseCase}) : super(LoginInitialState());
  var emailController = TextEditingController(text: "ahmed21@route.com");
  var passwordController = TextEditingController(text: "ahmed1234");
  var formKey = GlobalKey<FormState>();
  void login()async{
    if (formKey.currentState?.validate() == true ){
    emit(LoginLoadingState());
    var either = await loginUseCase.invoke(emailController.text, passwordController.text);
    either.fold((failures){
      emit(LoginErrorState(failures: failures));
    },
        (response){
      emit(LoginSuccessState(loginResponseEntity: response));

        });
  }
  }

}