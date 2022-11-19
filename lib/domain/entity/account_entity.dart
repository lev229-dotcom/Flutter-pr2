import 'package:flutter_application_1/data/model/userinfo.dart';
import 'package:flutter_application_1/domain/entity/role_entity.dart';

class AccountEntity {
  late int id;
  final String email;
  final String password;
  final RoleEnum id_role;
  final UserInfo userinfo_id;

  AccountEntity(
      {this.id = 0,
      required this.email,
      required this.password,
      required this.id_role,
      required this.userinfo_id});
}
