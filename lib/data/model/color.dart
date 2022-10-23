import 'package:flutter_application_1/domain/entity/car_body_entity.dart';
import 'package:flutter_application_1/domain/entity/color_entity.dart';
import 'package:flutter_application_1/domain/entity/role_entity.dart';

class Color extends ColorEntity {
  late int id;
  final String color_name;
  Color({
    required this.color_name,
  }) : super(
          color_name: color_name,
        );

  Map<String, dynamic> toMap() {
    return {'color_name': color_name};
  }

  factory Color.toFromMap(Map<String, dynamic> json) {
    return Color(color_name: json['color_name']);
  }
}
