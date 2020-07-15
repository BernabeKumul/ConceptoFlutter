import 'dart:async';

import 'package:servicio/core/usecases/usecase.dart';
import 'package:servicio/core/util/middleware_injector.dart';
import 'package:servicio/features/home/domain/Entities/producto.dart';
import 'package:servicio/features/home/presentation/store/actions/crear_producto.actions.dart';
import 'package:servicio/features/home/presentation/store/actions/home.actions.dart';
import 'package:servicio/features/home/presentation/store/comun/HomeDependency.dart';
import 'package:servicio/features/home/presentation/store/models/app_state.dart';

ThunkInjectedAction<HomeDependency, AppState> fetchProductoAction(
    mostrarError) {
  return (deps) => (store) {
        store.dispatch(new LoadingActionHome());
        deps.recuperarProducto.call(NoParams()).then((albums) {
          new Timer(const Duration(milliseconds: 500), () {
            store.dispatch(ProductoSuccessAction(albums));
          });
        }).catchError((error) {
          store.dispatch(ProductoFailedAction());
          mostrarError("Error al consultar productos");
        });
      };
}

ThunkInjectedAction<HomeDependency, AppState> fetchCrearAction(
    Producto producto, success, mostrarError) {
  return (deps) => (store) {
        store.dispatch(new CrearProductoLoadingAction());
        deps.crearProducto.call(producto).then((albums) {
          store.dispatch(CrearProductoSuccessAction(albums));
          success();
        }).catchError((error) {
          store.dispatch(CrearProductoFailedAction());
          mostrarError("Error al crear un producto");
        });
      };
}

ThunkInjectedAction<HomeDependency, AppState> fetchDesactivarAction(
    String productoId, success, mostrarError) {
  return (deps) => (store) {
        deps.desactivarProducto.call(productoId).then((albums) {
          store.dispatch(DesactivarProductoSuccessAction(albums));
          success();
        }).catchError((error) {
          store.dispatch(ProductoFailedAction());
          mostrarError("erro al desactivar el producto");
        });
      };
}
