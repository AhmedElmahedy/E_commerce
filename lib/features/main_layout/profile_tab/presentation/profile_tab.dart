import 'package:e_commerc/core/core/routes_manager/routes.dart';
import 'package:e_commerc/core/core/widget/hive_preference_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/core/resources/assets_manager.dart';
import '../../../../core/core/resources/color_manager.dart';
import '../../../../core/core/resources/font_manager.dart';
import '../../../../core/core/resources/styles_manager.dart';
import '../../../../core/core/resources/values_manager.dart';
import '../../../../core/core/widget/main_text_field.dart';
import '../../../../core/core/widget/validators.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  ProfileTabState createState() => ProfileTabState();
}

class ProfileTabState extends State<ProfileTab> {
  bool isFullNameReadOnly = true;
  bool isEmailReadOnly = true;
  bool isPasswordReadOnly = true;
  bool isMobileNumberReadOnly = true;
  bool isAddressReadOnly = true;
  String email = '';
  String name = '';

  @override
  void initState() {
    loadUserData();
  }

  void loadUserData() async {
    String? userEmail = await HivePreferenceUtil.getEmail();
    String? userName = await HivePreferenceUtil.getName();
    setState(() {
      email = userEmail?? '';
      name = userName?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SvgPicture.asset(
              //   SvgAssets.routeLogo,
              //   height: AppSize.s40,
              //   colorFilter: ColorFilter.mode(
              //     ColorManager.primary,
              //     BlendMode.srcIn,
              //   ),
              // ),
              // SizedBox(height: AppSize.s20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome, $name ',
                    style: getSemiBoldStyle(
                        color: ColorManager.primary, fontSize: FontSize.s18),
                  ),
                  IconButton(
                      onPressed: () {
                        // todo : remove token
                        HivePreferenceUtil.removeData(key: "token");
                        HivePreferenceUtil.removeData(key: "email");
                        HivePreferenceUtil.removeData(key: "name");

                        Navigator.of(context).pushNamedAndRemoveUntil(
                            Routes.signInRoute, (route) => false);
                      },
                      icon: Icon(Icons.logout))
                ],
              ),
              Text(
                email,
                style: getRegularStyle(
                    color: ColorManager.primary.withOpacity(.5),
                    fontSize: FontSize.s14),
              ),
              SizedBox(height: AppSize.s18.h),
              BuildTextField(
                borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                readOnly: isFullNameReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your full name',
                label: 'Full Name',
                controller: TextEditingController(text: name),
                labelTextStyle: getMediumStyle(
                    color: ColorManager.primary, fontSize: FontSize.s18),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(SvgAssets.edit),
                  onPressed: () {
                    setState(() {
                      isFullNameReadOnly = false;
                    });
                  },
                ),
                textInputType: TextInputType.text,
                validation: AppValidators.validateFullName,
                hintTextStyle: getRegularStyle(color: ColorManager.primary)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: AppSize.s18.h),
              BuildTextField(
                borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                readOnly: isEmailReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your email address',
                label: 'E-mail address',
                controller: TextEditingController(text: email),
                labelTextStyle: getMediumStyle(
                    color: ColorManager.primary, fontSize: FontSize.s18),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(SvgAssets.edit),
                  onPressed: () {
                    setState(() {
                      isEmailReadOnly = false;
                    });
                  },
                ),
                textInputType: TextInputType.emailAddress,
                validation: AppValidators.validateEmail,
                hintTextStyle: getRegularStyle(color: ColorManager.primary)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: AppSize.s18.h),
              BuildTextField(
                onTap: () {
                  setState(() {
                    isPasswordReadOnly = false;
                  });
                },
                controller: TextEditingController(),
                borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                readOnly: isPasswordReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your password',
                label: 'Password',
                isObscured: true,
                labelTextStyle: getMediumStyle(
                    color: ColorManager.primary, fontSize: FontSize.s18),
                suffixIcon: SvgPicture.asset(SvgAssets.edit),
                textInputType: TextInputType.text,
                validation: AppValidators.validatePassword,
                hintTextStyle: getRegularStyle(color: ColorManager.primary)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: AppSize.s18.h),
              BuildTextField(
                controller: TextEditingController(),
                borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                readOnly: isMobileNumberReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your mobile no.',
                label: 'Your mobile number',
                labelTextStyle: getMediumStyle(
                    color: ColorManager.primary, fontSize: FontSize.s18),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(SvgAssets.edit),
                  onPressed: () {
                    setState(() {
                      isMobileNumberReadOnly = false;
                    });
                  },
                ),
                textInputType: TextInputType.phone,
                validation: AppValidators.validatePhoneNumber,
                hintTextStyle: getRegularStyle(color: ColorManager.primary)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: AppSize.s18.h),
              BuildTextField(
                controller:
                    TextEditingController(),
                borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                readOnly: isAddressReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter Your Address',
                label: 'Your Address',
                labelTextStyle: getMediumStyle(
                    color: ColorManager.primary, fontSize: FontSize.s18),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(SvgAssets.edit),
                  onPressed: () {
                    setState(() {
                      isAddressReadOnly = false;
                    });
                  },
                ),
                textInputType: TextInputType.streetAddress,
                validation: AppValidators.validateFullName,
                hintTextStyle: getRegularStyle(color: ColorManager.primary)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: AppSize.s50.h),
            ],
          ),
        ),
      ),
    );
  }
}
