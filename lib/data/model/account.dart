import 'package:flutter_application_1/domain/entity/car_body_entity.dart';
import 'package:flutter_application_1/domain/entity/color_entity.dart';
import 'package:flutter_application_1/domain/entity/owner_entity.dart';
import 'package:flutter_application_1/domain/entity/role_entity.dart';

import '../../domain/entity/account_entity.dart';

class Account extends AccountEntity {
  late int id;
  final String email;
  final String password;
  final int role_id;
  Account({required this.email, required this.password, required this.role_id})
      : super(
          email: email,
          password: password,
          role_id: role_id,
        );

  Map<String, dynamic> toMap() {
    return {
      'login': email,
      'password': password,
      'role_id': role_id,
    };
  }

  factory Account.toFromMap(Map<String, dynamic> json) {
    return Account(
      email: json['login'],
      password: json['password'],
      role_id: json['role_id'],
    );
  }
}
