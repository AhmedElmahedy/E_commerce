import 'package:e_commerc/core/core/widget/dialog_utils.dart';
import 'package:e_commerc/core/core/widget/hive_preference_util.dart';
import 'package:e_commerc/domain/di/di.dart';
import 'package:e_commerc/features/auth.presentation.screens/login/cubit/login_states.dart';
import 'package:e_commerc/features/auth.presentation.screens/login/cubit/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/core/resources/assets_manager.dart';
import '../../../../../../core/core/resources/color_manager.dart';
import '../../../../../../core/core/resources/font_manager.dart';
import '../../../../../../core/core/resources/styles_manager.dart';
import '../../../../../../core/core/resources/values_manager.dart';
import '../../../../../../core/core/routes_manager/routes.dart';
import '../../../../../../core/core/widget/custom_elevated_button.dart';
import '../../../../../../core/core/widget/main_text_field.dart';
import '../../../../../../core/core/widget/validators.dart';


class LoginScreen extends StatelessWidget {
  // LoginViewModel viewModel = getIt<LoginViewModel>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginViewModel>(),
      child: BlocListener<LoginViewModel,LoginStates>(
        listener: (context,states){
          if(states is LoginLoadingState){
            DialogUtils.showLoading(context: context, message: "Loading....");
          }else if(states is LoginErrorState){
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context: context, message: states.failures.errorMessage,
                title: "Error",posActionName: "ok");

          }else if(states is LoginSuccessState){
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context: context, message: "Login Successfully",
                title: "Success",posActionName: "ok",);
            // todo : save token
            HivePreferenceUtil.saveData(key: "token", value: states.loginResponseEntity.token);
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
                  key: LoginViewModel.get(context).formKey,
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
                      Text(
                        'Welcome Back To Route',
                        style: getBoldStyle(color: ColorManager.white)
                            .copyWith(fontSize: FontSize.s24.sp),
                      ),
                      Text(
                        'Please sign in with your mail',
                        style: getLightStyle(color: ColorManager.white)
                            .copyWith(fontSize: FontSize.s16.sp),
                      ),
                      SizedBox(
                        height: AppSize.s50.h,
                      ),
                      BuildTextField(
                        controller: LoginViewModel.get(context).emailController,
                        backgroundColor: ColorManager.white,
                        hint: 'enter your email',
                        label: 'User Email',
                        textInputType: TextInputType.emailAddress,
                        validation: AppValidators.validateEmail,
                      ),
                      SizedBox(
                        height: AppSize.s28.h,
                      ),
                      BuildTextField(
                        controller: LoginViewModel.get(context).passwordController ,
                        hint: 'enter your password',
                        backgroundColor: ColorManager.white,
                        label: 'Password',
                        validation: AppValidators.validatePassword,
                        isObscured: true,
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(
                        height: AppSize.s8.h,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Forget password?',
                                style: getMediumStyle(color: ColorManager.white)
                                    .copyWith(fontSize: FontSize.s18.sp),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: AppSize.s60.h,
                      ),
                      Center(
                        child: SizedBox(
                          // width: MediaQuery.of(context).size.width * .8,
                          child: CustomElevatedButton(
                            // borderRadius: AppSize.s8,
                            isStadiumBorder: false,
                            label: 'Login',
                            backgroundColor: ColorManager.white,
                            textStyle: getBoldStyle(
                                color: ColorManager.primary, fontSize: AppSize.s18),
                            onTap: () {
                              LoginViewModel.get(context).login();

                              // Navigator.pushNamedAndRemoveUntil(
                              //     context, Routes.mainRoute, (route) => false);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account?',
                            style: getSemiBoldStyle(color: ColorManager.white)
                                .copyWith(fontSize: FontSize.s16.sp),
                          ),
                          SizedBox(
                            width: AppSize.s8.w,
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, Routes.signUpRoute),
                            child: Text(
                              'Create Account',
                              style: getSemiBoldStyle(color: ColorManager.white)
                                  .copyWith(fontSize: FontSize.s16.sp),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
