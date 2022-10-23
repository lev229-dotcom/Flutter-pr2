class CarEntity {
  late int id;
  final String engine_number;
  final String release_date_of_car;
  final int price;
  final int id_car_body;
  final int id_owner;
  final int id_color;
  final int id_transmission;
  CarEntity({
    required this.engine_number,
    required this.release_date_of_car,
    required this.price,
    required this.id_car_body,
    required this.id_owner,
    required this.id_color,
    required this.id_transmission,
  });
}
