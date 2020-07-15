
import 'package:servicio/core/usecases/usecase.dart';
import 'package:servicio/features/home/data/models/producto_model.dart';
import '../../../../core/usecases/usecase.dart';
import 'package:servicio/features/home/domain/repositories/producto_repository.dart';

class RecuperarProducto implements UseCase<List<ProductoModel>, NoParams>{
  final ProductoRepository repository;

  RecuperarProducto(
    this.repository
  );

  @override
  Future<List<ProductoModel>> call(NoParams params) {
    return repository.getProductos();
  }
}