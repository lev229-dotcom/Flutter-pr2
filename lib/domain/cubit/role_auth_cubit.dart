import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'role_auth_state.dart';

class RoleAuthCubit extends Cubit<RoleAuthState> {
  RoleAuthCubit() : super(RoleAuthInitial());

  ThemeData themeData = ThemeData(primaryColor: Colors.indigo);

  void changeTheme(int currentRole) {
    if (currentRole == 1) {
      themeData = ThemeData(
          primaryColor: Color.fromARGB(255, 246, 0, 0),
          backgroundColor: Color.fromARGB(255, 0, 106, 226),
          primarySwatch: Colors.amber);
      emit(WhiteTheme(themeData));
      currentRole = -1;
    }
    if (currentRole == 2) {
      themeData = ThemeData(
          canvasColor: Colors.deepOrange,
          cardColor: Colors.blueGrey,
          focusColor: Colors.white,
          primaryColor: Color.fromARGB(255, 32, 51, 176),
          backgroundColor: Colors.grey,
          primarySwatch: Colors.orange);
      emit(WhiteTheme(themeData));
      currentRole = -1;
    } else {
      themeData = ThemeData(
          primaryColor: Colors.teal,
          backgroundColor: Colors.white38,
          primarySwatch: Colors.indigo);
      emit(WhiteTheme(themeData));
      currentRole = -1;
    }
  }
}
