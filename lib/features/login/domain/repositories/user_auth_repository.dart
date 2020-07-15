
import 'package:servicio/features/login/data/models/auth.dart';
import 'package:servicio/features/login/domain/entities/user.dart';

abstract class UserRepository{
  Future<AuthModel> login(Usuario usuario);
}