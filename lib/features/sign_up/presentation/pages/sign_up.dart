import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_e_commerce/core/utils/app_colors.dart';
import 'package:route_e_commerce/core/utils/components.dart';
import 'package:route_e_commerce/features/sign_up/presentation/cubit/sign_up_cubit.dart';

import '../../../../config/routes/app_route.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/text_styles.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state) {
        if (state is SignUpErrorState) {
          showToast(text: state.failure.message, color: Colors.red);
        } else if (state is SignUpSuccessState) {
          showToast(text: 'Account created successfully', color: Colors.green);
          Navigator.pushReplacementNamed(context, Routes.login);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primary,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Form(
                  key: SignUpCubit.get(context).formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 60.h,
                      ),
                      Image.asset(
                        AppImages.routeLogoWhite,
                        height: 71.h,
                        width: 237.w,
                      ),
                      SizedBox(
                        height: 56.h,
                      ),
                      Text(
                        'Full Name',
                        style: poppins18W500(color: Colors.white),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      DefaultFormField(
                        controller: SignUpCubit.get(context).nameController,
                        type: TextInputType.name,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter a valid name.';
                          }
                          return null;
                        },
                        label: 'enter your full name',
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Text(
                        'Mobile Number',
                        style: poppins18W500(color: Colors.white),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      DefaultFormField(
                        controller: SignUpCubit.get(context).phoneController,
                        type: TextInputType.phone,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter a valid number.';
                          }
                          return null;
                        },
                        label: 'enter your mobile',
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Text(
                        'E-mail address',
                        style: poppins18W500(color: Colors.white),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      DefaultFormField(
                        controller: SignUpCubit.get(context).emailController,
                        type: TextInputType.emailAddress,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter a valid mail.';
                          }
                          return null;
                        },
                        label: 'enter your email address',
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Text(
                        'Password',
                        style: poppins18W500(color: Colors.white),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      DefaultFormField(
                        controller: SignUpCubit.get(context).passwordController,
                        type: TextInputType.text,
                        suffix: SignUpCubit.get(context).suffix,
                        isPassword: SignUpCubit.get(context).iPassword,
                        suffixPressed: () {
                          SignUpCubit.get(context).changePasswordVisibility();
                        },
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter a valid password.';
                          }
                          return null;
                        },
                        label: 'enter your password',
                      ),
                      SizedBox(
                        height: 56.h,
                      ),
                      state is SignUpLoadingState
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Container(
                                width: double.infinity,
                                height: 64.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            )
                          : DefaultButton(
                              background: Colors.white,
                              height: 64.h,
                              radius: 15,
                              function: () {
                                if (SignUpCubit.get(context)
                                    .formKey
                                    .currentState!
                                    .validate()) {
                                  SignUpCubit.get(context).signUp();
                                }
                              },
                              text: 'Sign up',
                              textStyle:
                                  poppins20W600(color: AppColors.primary),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
