import 'package:flutter_application_1/core/crypto/crypto.dart';
import 'package:flutter_application_1/data/model/userinfo.dart';
import 'package:flutter_application_1/domain/entity/car_body_entity.dart';
import 'package:flutter_application_1/domain/entity/color_entity.dart';
import 'package:flutter_application_1/domain/entity/owner_entity.dart';
import 'package:flutter_application_1/domain/entity/role_entity.dart';

import '../../domain/entity/account_entity.dart';

class Account extends AccountEntity {
  Account(
      {super.id = 0,
      required super.email,
      required super.password,
      required super.id_role,
      required super.userinfo_id});

  Map<String, dynamic> toMap() {
    return {
      'login': email,
      'password': Crypto.encoding(password),
      'id_role': id_role.id,
      'userinfo_id': userinfo_id.id
    };
  }

  factory Account.toFromMap(Map<String, dynamic> json) {
    return Account(
        email: json['login'],
        password: json['password'],
        id_role: RoleEnum.values
            .firstWhere((element) => element.id == (json['id_role'] as int)),
        userinfo_id: UserInfo.toFromMap(json));
  }
}
