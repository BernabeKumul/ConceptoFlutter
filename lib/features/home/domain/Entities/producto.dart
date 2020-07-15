// import 'package:equatable/equatable.dart';
import 'dart:convert';

import 'package:meta/meta.dart';

class Producto{
  final String nombre;
  final String descripcion;
  final String urlImg;

  Producto({
    @required this.nombre,
    @required this.descripcion,
    @required this.urlImg
  });

   String toJsonEncode() {
    return jsonEncode(<String, String>{
      'nombre': nombre,
      'descripcion': descripcion,
      'urlImg': urlImg,
    });
  }
}