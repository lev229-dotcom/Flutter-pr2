class AccountEntity {
  late int id;
  final String email;
  final String password;
  final int role_id;

  AccountEntity(
      {required this.email, required this.password, required this.role_id});
}

//enum EngineEnum{}