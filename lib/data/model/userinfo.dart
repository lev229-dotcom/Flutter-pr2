import 'package:flutter_application_1/domain/entity/car_body_entity.dart';
import 'package:flutter_application_1/domain/entity/color_entity.dart';
import 'package:flutter_application_1/domain/entity/owner_entity.dart';
import 'package:flutter_application_1/domain/entity/role_entity.dart';

import '../../domain/entity/userinfo_entity.dart';

class UserInfo extends UserInfoEntity {
  late int id;
  final String surname;
  final String name;
  final String patronymic;
  final String date_of_birth;
  UserInfo({
    required this.surname,
    required this.name,
    required this.patronymic,
    required this.date_of_birth,
  }) : super(
          surname: surname,
          name: name,
          patronymic: patronymic,
          date_of_birth: date_of_birth,
        );

  Map<String, dynamic> toMap() {
    return {
      'surname': surname,
      'name': name,
      'patronymic': patronymic,
      'date_of_birth': date_of_birth,
    };
  }

  factory UserInfo.toFromMap(Map<String, dynamic> json) {
    return UserInfo(
      surname: json['surname'],
      name: json['name'],
      patronymic: json['patronymic'],
      date_of_birth: json['date_of_birth'],
    );
  }
}
