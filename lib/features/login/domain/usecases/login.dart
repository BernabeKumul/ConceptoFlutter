
import 'package:servicio/core/usecases/usecase.dart';
import 'package:servicio/features/login/data/models/auth.dart';
import 'package:servicio/features/login/domain/entities/user.dart';
import 'package:servicio/features/login/domain/repositories/user_auth_repository.dart';
import '../../../../core/usecases/usecase.dart';

class Login implements UseCase<AuthModel, Usuario>{
  final UserRepository repository;

  Login(
    this.repository
  );

  @override
  Future<AuthModel> call(Usuario params) {
    return repository.login(params);
  }
}