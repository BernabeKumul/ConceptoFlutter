import 'dart:convert';

import 'package:meta/meta.dart';

class Usuario{
  final String email;
  final String password;

  Usuario({
    @required this.email,
    @required this.password
  });

   String toJsonEncode() {
    return jsonEncode(<String, String>{
      'email': email,
      'password': password
    });
  }
}