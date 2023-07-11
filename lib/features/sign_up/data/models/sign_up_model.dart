// ignore_for_file: must_be_immutable

import 'package:route_e_commerce/features/sign_up/domain/entities/sign_up_entity.dart';

class SignUpModel extends SignUpEntity {
  SignUpModel({
    this.message,
    super.user,
    super.token,
  });

  SignUpModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? message;
}

class User extends UserEntity {
  User({
    super.name,
    super.email,
    this.role,
  });

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;
}
