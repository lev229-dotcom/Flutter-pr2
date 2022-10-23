import 'package:flutter_application_1/domain/entity/car_body_entity.dart';
import 'package:flutter_application_1/domain/entity/color_entity.dart';
import 'package:flutter_application_1/domain/entity/owner_entity.dart';
import 'package:flutter_application_1/domain/entity/role_entity.dart';

class Owner extends OwnerEntity {
  late int id;
  final String surname;
  final String name;
  final String patronymic;
  final String date_of_registartion;
  final String date_of_de_registartion;
  Owner(
      {required this.surname,
      required this.name,
      required this.patronymic,
      required this.date_of_registartion,
      required this.date_of_de_registartion})
      : super(
            surname: surname,
            name: name,
            patronymic: patronymic,
            date_of_registartion: date_of_registartion,
            date_of_de_registartion: date_of_de_registartion);

  Map<String, dynamic> toMap() {
    return {
      'surname': surname,
      'name': name,
      'patronymic': patronymic,
      'date_of_registartion': date_of_registartion,
      'date_of_de_registartion': date_of_de_registartion
    };
  }

  factory Owner.toFromMap(Map<String, dynamic> json) {
    return Owner(
        surname: json['surname'],
        name: json['name'],
        patronymic: json['patronymic'],
        date_of_registartion: json['date_of_registartion'],
        date_of_de_registartion: json['date_of_de_registartion']);
  }
}
