import 'package:dartz/dartz.dart';
import 'package:e_commerc/domain/use_cases/register_use_case.dart';
import 'package:e_commerc/features/auth.presentation.screens/register/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  RegisterViewModel({required this.registerUseCase})
      : super(RegisterInitialState());
  var nameController = TextEditingController(text: "Ahmed");
  var emailController = TextEditingController(text: "ahmed21@route.com");
  var passwordController = TextEditingController(text: "ahmed1234");
  var rePasswordController = TextEditingController(text: "ahmed1234");
  var phoneController = TextEditingController(text: '01006450914');
  var formKey = GlobalKey<FormState>();

  // TODO : hold data -handle logic
  void register() async {
    if (formKey.currentState!.validate()== true) {
      emit(RegisterLoadingState());
      var either = await registerUseCase.invoke(
          nameController.text,
          emailController.text,
          passwordController.text,
          rePasswordController.text,
          phoneController.text);
      either.fold((l) {
        emit(RegisterErrorState(failures: l));
      }, (response) {
        emit(RegisterSuccessState(registerResponseEntity: response));
      });
    }
  }
}
