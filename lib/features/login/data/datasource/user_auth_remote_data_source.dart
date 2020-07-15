import 'dart:convert';

import 'package:servicio/core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:servicio/features/login/data/models/auth.dart';
import 'package:servicio/features/login/domain/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class UserAuthRemoteDataSource{
  Future<AuthModel> login(Usuario usuario);
}


const TOKEN = 'TOKEN';

class UserAuthRemoteDataSourceImple implements UserAuthRemoteDataSource{
  final http.Client client;
  final SharedPreferences sharedPreferences;

  UserAuthRemoteDataSourceImple({@required this.client, @required this.sharedPreferences});

  @override
  Future<AuthModel> login(Usuario usuario) async {
    final response = await client.post(
      'http://192.168.8.195/movil/api/autenticacion/login',
     headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
      body: usuario.toJsonEncode()
    );

    if (response.statusCode == 200) {
      final decodedTasks = json.decode(response.body);
      final data = AuthModel.fromJson(decodedTasks);
      sharedPreferences.setString(
        TOKEN,
        data.token
      );
      return data;
    } else {
      throw ServerException();
    }
  }
}