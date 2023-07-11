// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class SignUpEntity extends Equatable {
  SignUpEntity({
    this.user,
    this.token,
  });

  UserEntity? user;
  String? token;

  @override
  List<Object?> get props => [user, token];
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
