import 'package:redux/redux.dart';
import 'package:servicio/features/home/data/models/producto_model.dart';
import 'package:servicio/features/home/domain/Entities/producto.dart';
import 'package:servicio/features/home/presentation/store/effects/HomeEfects.dart';
import 'package:servicio/features/home/presentation/store/models/app_state.dart';

class HomeProps {
  final Function(Function(String mensaje) mostrarError) obtenerProductos;
  final Function(Producto producto, Function success, Function(String mensaje) mostrarError)
      crearProducto;
  final Function(String productoId, Function success, Function(String mensaje) mostrarError)
      desactivarProducto;
  final bool isLoading;
  final List<ProductoModel> lstProductos;
  // final ProductoModel lstProd}uctos;

  HomeProps(
      {this.isLoading,
      this.obtenerProductos,
      this.lstProductos,
      this.crearProducto,
      this.desactivarProducto});
}

HomeProps mapToProps(Store<AppState> store) {
  return HomeProps(
    lstProductos: store.state.productoState.productos,
    isLoading: store.state.productoState.isLoading,
    obtenerProductos: (mostrarError) async {
      store.dispatch(fetchProductoAction(mostrarError));
    },
    crearProducto: (pro, success, mostrarError) async {
      store.dispatch(fetchCrearAction(pro, success, mostrarError));
    },
    desactivarProducto: (productoId, success, mostrarError) async {
      store.dispatch(fetchDesactivarAction(productoId, success, mostrarError));
    },
  );
}
