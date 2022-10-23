import 'package:flutter_application_1/domain/entity/car_body_entity.dart';
import 'package:flutter_application_1/domain/entity/transmission_entity.dart';
import 'package:flutter_application_1/domain/entity/role_entity.dart';

class Transmission extends TransmissionEntity {
  late int id;
  final String transmission_name;

  Transmission({required this.transmission_name})
      : super(transmission_name: transmission_name);

  Map<String, dynamic> toMap() {
    return {'transmission_name': transmission_name};
  }

  factory Transmission.toFromMap(Map<String, dynamic> json) {
    return Transmission(transmission_name: json['transmission_name']);
  }
}
