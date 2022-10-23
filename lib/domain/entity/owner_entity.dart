class OwnerEntity {
  late int id;
  final String surname;
  final String name;
  final String patronymic;
  final String date_of_registartion;
  final String date_of_de_registartion;
  OwnerEntity(
      {required this.surname,
      required this.name,
      required this.patronymic,
      required this.date_of_registartion,
      required this.date_of_de_registartion});
}

//enum EngineEnum{}