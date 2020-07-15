import 'package:servicio/core/network/network_info.dart';
import 'package:servicio/features/login/data/datasource/user_auth_remote_data_source.dart';
import 'package:servicio/features/login/data/models/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:servicio/features/login/domain/entities/user.dart';
import 'package:servicio/features/login/domain/repositories/user_auth_repository.dart';

class UserAuthRepositoryImple implements UserRepository{
  final UserAuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  UserAuthRepositoryImple({
    @required this.remoteDataSource,
    @required this.networkInfo
  });

  @override
  Future<AuthModel> login(Usuario usuario) {
    return remoteDataSource.login(usuario);
  }
}