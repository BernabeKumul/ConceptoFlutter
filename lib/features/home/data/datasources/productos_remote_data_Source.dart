import 'dart:convert';

import 'package:servicio/core/error/exceptions.dart';
import 'package:servicio/features/home/data/models/producto_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:servicio/features/home/domain/Entities/producto.dart';
import 'package:servicio/features/login/data/datasource/user_auth_remote_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductoRemoteDataSource{
  Future<List<ProductoModel>> recuperarProductos();
  Future<ProductoModel> crearProducto(Producto producto);
  Future<ProductoModel> desactivarProducto(String productoId);
}

class ProductoRemoteDataSourceImple implements ProductoRemoteDataSource{
  final http.Client client;
  final SharedPreferences sharedPreferences;


  ProductoRemoteDataSourceImple({@required this.client, @required this.sharedPreferences});


  @override
  Future<List<ProductoModel>> recuperarProductos() async  {
    final token = sharedPreferences.getString(TOKEN);
    // print(token);
    final response = await client.get(
      'http://192.168.8.195/movil/api/productos',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}'
      },
    );

    if (response.statusCode == 200) {
      final decodedTasks = json.decode(response.body) as List;
      final data = decodedTasks.map((jsonTask) => ProductoModel.fromJson(jsonTask)).toList();
      return data;
      // return response.body
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductoModel> crearProducto(Producto producto) async {
  final token = sharedPreferences.getString(TOKEN);
   final response = await client.post(
      'http://192.168.8.195/movil/api/productos',
     headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${token}'
    },
      body: producto.toJsonEncode()
    );

    if (response.statusCode == 200) {
      final decodedTasks = json.decode(response.body);
      final data = ProductoModel.fromJson(decodedTasks);
      return data;
      // return response.body
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductoModel> desactivarProducto(String productoId) async {
    final token = sharedPreferences.getString(TOKEN);
    final response = await client.put(
      'http://192.168.8.195/movil/api/productos/${productoId}',
     headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${token}'
    }
    );

    if (response.statusCode == 200) {
      final decodedTasks = json.decode(response.body);
      final data = ProductoModel.fromJson(decodedTasks);
      return data;
      // return response.body
    } else {
      throw ServerException();
    }
  }
}