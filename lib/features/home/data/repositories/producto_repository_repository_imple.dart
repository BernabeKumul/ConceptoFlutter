import 'package:flutter/cupertino.dart';
import 'package:servicio/core/network/network_info.dart';
import 'package:servicio/features/home/data/models/producto_model.dart';
import 'package:servicio/features/home/data/datasources/productos_remote_data_Source.dart';
import 'package:servicio/features/home/domain/Entities/producto.dart';
import 'package:servicio/features/home/domain/repositories/producto_repository.dart';

class ProductoRepositoryImple implements ProductoRepository{
  final ProductoRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ProductoRepositoryImple({
    @required this.remoteDataSource,
    @required this.networkInfo
  });

  @override
 Future<List<ProductoModel>> getProductos() {
      return remoteDataSource.recuperarProductos();
  }

  @override
  Future<ProductoModel> crearProducto(Producto producto) {
    return remoteDataSource.crearProducto(producto);
  }

  @override
  Future<ProductoModel> desactivarProducto(String productoId) {
    return remoteDataSource.desactivarProducto(productoId);
  }


  
}