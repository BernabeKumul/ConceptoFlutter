
import 'package:servicio/core/usecases/usecase.dart';
import 'package:servicio/features/home/data/models/producto_model.dart';
import 'package:servicio/features/home/domain/Entities/producto.dart';
import '../../../../core/usecases/usecase.dart';
import 'package:servicio/features/home/domain/repositories/producto_repository.dart';

class CrearProducto implements UseCase<ProductoModel, Producto>{
  final ProductoRepository repository;

  CrearProducto(
    this.repository
  );

  @override
  Future<ProductoModel> call(Producto params) {
    return repository.crearProducto(params);
  }
}