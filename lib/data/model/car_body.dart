import 'package:flutter_application_1/domain/entity/car_body_entity.dart';
import 'package:flutter_application_1/domain/entity/role_entity.dart';

class CarBody extends CarBodyEntity {
  late int id;
  final String body_name;
  final String number_of_doors;
  CarBody({
    required this.body_name,
    required this.number_of_doors,
  }) : super(body_name: body_name, number_of_doors: number_of_doors);

  Map<String, dynamic> toMap() {
    return {
      'body_name': body_name,
      'number_of_doors': number_of_doors,
    };
  }

  factory CarBody.toFromMap(Map<String, dynamic> json) {
    return CarBody(
        body_name: json['body_name'], number_of_doors: json['number_of_doors']);
  }
}
