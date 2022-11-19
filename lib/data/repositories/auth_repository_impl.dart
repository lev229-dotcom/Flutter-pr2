import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/db/data_base_helper.dart';
import 'package:flutter_application_1/core/crypto/crypto.dart';
import 'package:flutter_application_1/data/model/userinfo.dart';

import 'package:flutter_application_1/domain/entity/role_entity.dart';
import 'package:sqflite/sqflite.dart';

import '../../common/data_base_request.dart';
import '../../domain/repositories/auth_repositories.dart';
import '../model/account.dart';

class AuthRepositoiriesImpl implements AuthRepositories {
  final _db = DataBaseHelper.instance.database;

  @override
  Future<Either<String, RoleEnum>> signIn(String login, String password) async {
    try {
      final user = (await _db.rawQuery(
              'SELECT login, password, id_role, surname, name, patronymic, date_of_birth FROM Users inner join UserInfo on userinfo_id=UserInfo.id WHERE login = "$login"'))
          .map((e) => Account.toFromMap(e));
      if (user.isEmpty) {
        return Left("Пароль или логин неправильны");
      }
      if (user.first.password != Crypto.encoding(password)) {
        return Left("Указанный пароль неверный");
      }
      return Right(user.first.id_role);
    } on DatabaseException catch (error) {
      print(error.result);
      return Left("Произошла внутренняя оишбка");
    }
  }

  @override
  Future<Either<String, bool>> signUp(
      String login,
      String password,
      String surname,
      String name,
      String patronymic,
      String date_of_birth) async {
    try {
      await _db.insert(
          DataBaseRequest.tableUserInfo,
          UserInfo(
                  surname: surname,
                  name: name,
                  patronymic: patronymic,
                  date_of_birth: date_of_birth)
              .toMap());
      String query = 'SELECT last_insert_rowid()';
      final List<Map<String, dynamic>> maps = await _db.rawQuery(query);
      String toparse = maps.single.toString();
      toparse = toparse.substring(0 + toparse.length - 3, toparse.length - 1);
      int currentId = int.parse(toparse);
      await _db.insert(
          table,
          Account(
                  id: currentId,
                  email: login,
                  password: password,
                  id_role: RoleEnum.user,
                  userinfo_id: UserInfo(
                      id: currentId,
                      surname: surname,
                      name: name,
                      patronymic: patronymic,
                      date_of_birth: date_of_birth))
              .toMap());
      return const Right(true);
    } on DatabaseException catch (error) {
      print(error.result);
      return const Left('');
    }
  }

  @override
  String get table => DataBaseRequest.tableUsers;
}
