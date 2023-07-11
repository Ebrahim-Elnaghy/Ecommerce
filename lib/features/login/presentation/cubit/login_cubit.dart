import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../data/datasources/login_data_sources.dart';
import '../../data/repositories/login_data_repo.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/login_domain_repo.dart';
import '../../domain/usecases/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginDataSources sources;

  LoginCubit({required this.sources}) : super(LoginInitial());

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  static LoginCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool iPassword = true;

  void changePasswordVisibility() {
    iPassword = !iPassword;
    suffix =
        iPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibilityState());
  }

  void login() async {
    emit(LoginLoadingState());
    LoginDomainRepo loginDomainRepo = LoginDataRepo(sources);
    LoginUseCase loginUseCase = LoginUseCase(loginDomainRepo);
    var result = await loginUseCase.call(
        emailController.text, passwordController.text);

    result.fold((l) {
      emit(LoginErrorState(failure: l));
    }, (r) {
      emit(LoginSuccessState(loginEntity: r));
    });
  }

}
