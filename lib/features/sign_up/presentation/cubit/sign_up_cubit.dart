import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../data/datasources/sign_sup_data_sources.dart';
import '../../data/repositories/sign_up_data_repo.dart';
import '../../domain/entities/sign_up_entity.dart';
import '../../domain/entities/user_data.dart';
import '../../domain/repositories/sign_up_domain_repo.dart';
import '../../domain/usecases/sign_up_use_case.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpDataSources signUpDataSources;

  SignUpCubit({required this.signUpDataSources}) : super(SignUpInitial());

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey= GlobalKey<FormState>();
  IconData suffix= Icons.visibility_outlined;
  bool iPassword= true;

  void changePasswordVisibility(){
    iPassword= !iPassword;
    suffix= iPassword? Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(SignUpChangePasswordVisibilityState());
  }

  static SignUpCubit get(context) => BlocProvider.of(context);

  void signUp() async {
    emit(SignUpLoadingState());
    SignUpDomainRepo signUpDomainRepo =
        SignUpDataRepo(signUpDataSources: signUpDataSources);
    SignUpUseCase signUpUseCase = SignUpUseCase(signUpDomainRepo);
    UserData userData = UserData(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        rePassword: passwordController.text,
        phone: phoneController.text);

    var result = await signUpUseCase.call(userData);
    result.fold((l) {
      emit(SignUpErrorState(l));
    }, (r) {
      emit(SignUpSuccessState(r));
    });
  }
}
