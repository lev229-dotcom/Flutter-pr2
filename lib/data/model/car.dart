import 'package:flutter_application_1/domain/entity/car_body_entity.dart';
import 'package:flutter_application_1/domain/entity/color_entity.dart';
import 'package:flutter_application_1/domain/entity/owner_entity.dart';
import 'package:flutter_application_1/domain/entity/role_entity.dart';

import '../../domain/entity/car_entity.dart';

class Car extends CarEntity {
  late int id;
  final String engine_number;
  final String release_date_of_car;
  final int price;
  final int id_car_body;
  final int id_owner;
  final int id_color;
  final int id_transmission;
  Car({
    required this.engine_number,
    required this.release_date_of_car,
    required this.price,
    required this.id_car_body,
    required this.id_owner,
    required this.id_color,
    required this.id_transmission,
  }) : super(
          engine_number: engine_number,
          release_date_of_car: release_date_of_car,
          price: price,
          id_car_body: id_car_body,
          id_owner: id_owner,
          id_color: id_color,
          id_transmission: id_transmission,
        );

  Map<String, dynamic> toMap() {
    return {
      'number': engine_number,
      'release_date_of_car': release_date_of_car,
      'price': price,
      'id_car_body': id_car_body,
      'id_owner': id_owner,
      'id_color': id_color,
      'id_transmission': id_transmission,
    };
  }

  factory Car.toFromMap(Map<String, dynamic> json) {
    return Car(
      engine_number: json['number'],
      release_date_of_car: json['number_of_doors'],
      price: json['cost'],
      id_car_body: json['id_car_body'],
      id_owner: json['id_owner'],
      id_color: json['id_color'],
      id_transmission: json['id_transmission'],
    );
  }
}
