import 'package:dartz/dartz.dart';
import '../../domain/entity/role_entity.dart';

abstract class AuthUserCase<Type, Params, ParamsLogin> {
  Future<Either<Type, RoleEnum>> signIn(ParamsLogin params);
  Future<Either<Type, bool>> signUp(Params params);
}
