import 'package:servicio/features/login/data/models/auth.dart';

class LoginLoadingAction{
  LoginLoadingAction();
}

class LoginSuccessAction{
  final AuthModel data;

  LoginSuccessAction(this.data);
}

class LoginFailedAction{
  LoginFailedAction();
}