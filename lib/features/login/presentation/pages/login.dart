import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_e_commerce/config/routes/app_route.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/cache_helper.dart';
import '../../../../core/utils/components.dart';
import '../../../../core/utils/text_styles.dart';
import '../cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          showToast(text: state.failure.message, color: Colors.red);
        } else if (state is LoginSuccessState) {
          CacheHelper.saveData(key: 'userToken', value: state.loginEntity.token)
              .then((value) {
            if (value) {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.home, (route) => false);
            }
          });
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
                  key: LoginCubit.get(context).formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 91.h,
                      ),
                      Image.asset(
                        AppImages.routeLogoWhite,
                        height: 71.h,
                        width: 237.w,
                      ),
                      SizedBox(
                        height: 87.h,
                      ),
                      Text(
                        'Welcome Back To Route',
                        style: poppins24W600(color: Colors.white),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Please sign in with your mail',
                        style: poppins16W300(color: Colors.white),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Text(
                        'User Name',
                        style: poppins18W500(color: Colors.white),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      DefaultFormField(
                        controller: LoginCubit.get(context).emailController,
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
                        controller: LoginCubit.get(context).passwordController,
                        type: TextInputType.text,
                        suffix: LoginCubit.get(context).suffix,
                        isPassword: LoginCubit.get(context).iPassword,
                        suffixPressed: () {
                          LoginCubit.get(context).changePasswordVisibility();
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
                        height: 16.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          DefaultTextButton(
                              function: () {}, text: 'Forgot password'),
                        ],
                      ),
                      SizedBox(
                        height: 56.h,
                      ),
                      state is LoginLoadingState
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
                                if (LoginCubit.get(context)
                                    .formKey
                                    .currentState!
                                    .validate()) {
                                  LoginCubit.get(context).login();
                                }
                              },
                              text: 'Login',
                              textStyle:
                                  poppins20W600(color: AppColors.primary),
                            ),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account? ',
                            style: poppins18W500(color: Colors.white),
                          ),
                          DefaultTextButton(
                            function: () {
                              Navigator.pushNamed(context, Routes.signUp);
                            },
                            text: 'Create Account',
                            textStyle: poppins18W500(color: Colors.white),
                          ),
                        ],
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
