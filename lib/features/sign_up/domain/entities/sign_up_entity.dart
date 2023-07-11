// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class SignUpEntity extends Equatable {
  SignUpEntity({
    this.message,
    this.user,
    this.token,
  });

  String? message;
  UserEntity? user;
  String? token;

  @override
  List<Object?> get props => [message, user, token];
}

class UserEntity extends Equatable {
  UserEntity({
    this.name,
    this.email,
  });

  String? name;
  String? email;

  @override
  List<Object?> get props => [name, email];
}
