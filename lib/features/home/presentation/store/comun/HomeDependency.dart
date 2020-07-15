import 'package:flutter/foundation.dart';
import 'package:servicio/features/home/domain/usecases/crear_producto.dart';
import 'package:servicio/features/home/domain/usecases/desactivar_producto.dart';
import 'package:servicio/features/home/domain/usecases/recuperar_producto.dart';

@immutable
class HomeDependency {
  final RecuperarProducto recuperarProducto;
  final CrearProducto crearProducto;
  final DesactivarProducto desactivarProducto;

  const HomeDependency(
      {this.recuperarProducto, this.crearProducto, this.desactivarProducto});
}
