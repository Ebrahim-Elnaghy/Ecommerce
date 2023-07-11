part of 'login_cubit.dart';

abstract class LoginStates {
  const LoginStates();
}

class LoginInitial extends LoginStates {}
class LoginLoadingState extends LoginStates {}
class LoginSuccessState extends LoginStates {
  LoginEntity loginEntity;
  LoginSuccessState({required this.loginEntity});
}
class LoginErrorState extends LoginStates {
  Failures failure;
  LoginErrorState({required this.failure});
}
class LoginChangePasswordVisibilityState extends LoginStates {}
