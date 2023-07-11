part of 'sign_up_cubit.dart';

abstract class SignUpStates {
  const SignUpStates();
}

class SignUpInitial extends SignUpStates {}
class SignUpLoadingState extends SignUpStates {}
class SignUpSuccessState extends SignUpStates {
  SignUpEntity signUpEntity;

  SignUpSuccessState(this.signUpEntity);
}
class SignUpErrorState extends SignUpStates {
  Failures failure;

  SignUpErrorState(this.failure);
}
class SignUpChangePasswordVisibilityState extends SignUpStates {

}
