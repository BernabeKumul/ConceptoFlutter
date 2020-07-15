import 'package:flutter/foundation.dart';
import 'package:servicio/features/login/domain/usecases/login.dart';

@immutable
class LoginDependency {
  final Login login;

  const LoginDependency(
      {this.login});
}
