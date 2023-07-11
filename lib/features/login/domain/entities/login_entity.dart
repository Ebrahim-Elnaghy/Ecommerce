// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import '../../../sign_up/domain/entities/sign_up_entity.dart';

class LoginEntity extends Equatable {
  LoginEntity({
    required this.user,
    required this.token,
  });

  UserEntity user;
  String token;

  @override
  List<Object?> get props => [user, token];
}
