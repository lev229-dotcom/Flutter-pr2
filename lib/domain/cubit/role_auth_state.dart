part of 'role_auth_cubit.dart';

@immutable
abstract class RoleAuthState {}

class RoleAuthInitial extends RoleAuthState {}

class WhiteTheme extends RoleAuthState {
  final ThemeData theme;

  WhiteTheme(this.theme);
}

class BlackTheme extends RoleAuthState {
  final ThemeData theme;

  BlackTheme(this.theme);
}
