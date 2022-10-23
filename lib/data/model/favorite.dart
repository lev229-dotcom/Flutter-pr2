import 'package:flutter_application_1/domain/entity/car_body_entity.dart';
import 'package:flutter_application_1/domain/entity/color_entity.dart';
import 'package:flutter_application_1/domain/entity/owner_entity.dart';
import 'package:flutter_application_1/domain/entity/role_entity.dart';

import '../../domain/entity/favorite_entity.dart';

class Favorite extends FavoriteEntity {
  late int id;
  final int user_id;
  final int car_id;
  Favorite({
    required this.user_id,
    required this.car_id,
  }) : super(
          user_id: user_id,
          car_id: car_id,
        );

  Map<String, dynamic> toMap() {
    return {
      'user_id': user_id,
      'car_id': car_id,
    };
  }

  factory Favorite.toFromMap(Map<String, dynamic> json) {
    return Favorite(user_id: json['user_id'], car_id: json['car_id']);
  }
}
