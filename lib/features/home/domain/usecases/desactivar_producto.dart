
import 'package:servicio/core/usecases/usecase.dart';
import 'package:servicio/features/home/data/models/producto_model.dart';
import '../../../../core/usecases/usecase.dart';
import 'package:servicio/features/home/domain/repositories/producto_repository.dart';

class DesactivarProducto implements UseCase<ProductoModel, String>{
  final ProductoRepository repository;

  DesactivarProducto(
    this.repository
  );

  @override
  Future<ProductoModel> call(String params) {
    return repository.desactivarProducto(params);
  }
}