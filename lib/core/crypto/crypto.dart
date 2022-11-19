import 'dart:convert';
import 'package:crypto/crypto.dart';

class Crypto {
  static String encoding(String password) {
    var bytes = utf8.encode(password);
    return sha512.convert(bytes).toString();
  }
}
