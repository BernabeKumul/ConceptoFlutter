
import 'package:servicio/features/home/data/models/producto_model.dart';
import 'package:servicio/features/home/domain/Entities/producto.dart';

abstract class ProductoRepository{
  Future<List<ProductoModel>> getProductos();
  Future<ProductoModel> crearProducto(Producto producto);
  Future<ProductoModel> desactivarProducto(String productoId);
}