import 'package:e_commerc/core/core/routes_manager/routes.dart';
import 'package:e_commerc/core/core/widget/dialog_utils.dart';
import 'package:e_commerc/core/core/widget/hive_preference_util.dart';
import 'package:e_commerc/domain/di/di.dart';
import 'package:e_commerc/features/auth.presentation.screens/login/presentation/login_screen.dart';
import 'package:e_commerc/features/auth.presentation.screens/register/cubit/register_states.dart';
import 'package:e_commerc/features/auth.presentation.screens/register/cubit/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/core/resources/assets_manager.dart';
import '../../../../../../core/core/resources/color_manager.dart';
import '../../../../../../core/core/resources/styles_manager.dart';
import '../../../../../../core/core/resources/values_manager.dart';
import '../../../../../../core/core/widget/custom_elevated_button.dart';
import '../../../../../../core/core/widget/main_text_field.dart';
import '../../../../../../core/core/widget/validators.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static _checkHiveData() async {
    String? token = await HivePreferenceUtil.getData();
    String? email = await HivePreferenceUtil.getEmail();
    String? name = await HivePreferenceUtil.getName();

    // todo: Check return data
    print("Token: ${token ?? 'No Token Found'}");
    print("Email: ${email ?? 'No Email Found'}");
    print("Name: ${name ?? 'No Name Found'}");
  }

  RegisterViewModel viewModel = getIt<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context: context, message: "Loading....");
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.failures.errorMessage,
              title: "Error",
              posActionName: "ok");
        } else if (state is RegisterSuccessState) {
          HivePreferenceUtil.saveData(
              value: state.registerResponseEntity.token ?? '');
          HivePreferenceUtil.saveName(
              value: state.registerResponseEntity.user?.name ?? '');
          HivePreferenceUtil.saveEmail(
              value: state.registerResponseEntity.user?.name ?? '');
          _checkHiveData();
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: "Register Successfully",
              title: "Success",
              posActionName: "ok");
          Navigator.pushReplacementNamed(context, Routes.mainRoute);
        }
      },
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: SingleChildScrollView(
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: AppSize.s40.h,
                    ),
                    Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                    SizedBox(
                      height: AppSize.s40.h,
                    ),
                    BuildTextField(
                      backgroundColor: ColorManager.white,
                      hint: 'enter your full name',
                      label: 'Full Name',
                      textInputType: TextInputType.name,
                      validation: AppValidators.validateFullName,
                      controller: viewModel.nameController,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      hint: 'enter your mobile no.',
                      backgroundColor: ColorManager.white,
                      label: 'Mobile Number',
                      validation: AppValidators.validatePhoneNumber,
                      textInputType: TextInputType.phone,
                      controller: viewModel.phoneController,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      hint: 'enter your email address',
                      backgroundColor: ColorManager.white,
                      label: 'E-mail address',
                      validation: AppValidators.validateEmail,
                      textInputType: TextInputType.emailAddress,
                      controller: viewModel.emailController,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      hint: 'enter your password',
                      backgroundColor: ColorManager.white,
                      label: 'password',
                      validation: AppValidators.validatePassword,
                      isObscured: true,
                      textInputType: TextInputType.text,
                      controller: viewModel.passwordController,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      hint: 'enter your rePassword',
                      backgroundColor: ColorManager.white,
                      label: 'rePassword',
                      validation: AppValidators.validatePassword,
                      isObscured: true,
                      textInputType: TextInputType.text,
                      controller: viewModel.rePasswordController,
                    ),
                    SizedBox(
                      height: AppSize.s50.h,
                    ),
                    Center(
                      child: SizedBox(
                        height: AppSize.s60.h,
                        width: MediaQuery.of(context).size.width * .9,
                        child: CustomElevatedButton(
                          // borderRadius: AppSize.s8,
                          label: 'Sign Up',
                          backgroundColor: ColorManager.white,
                          textStyle: getBoldStyle(
                              color: ColorManager.primary,
                              fontSize: AppSize.s20),
                          onTap: () {
                            viewModel.register();
                            // Navigator.pushNamed(context, Routes.mainRoute);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
