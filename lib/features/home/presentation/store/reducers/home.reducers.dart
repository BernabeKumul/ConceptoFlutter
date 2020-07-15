import 'package:redux/redux.dart';
import 'package:servicio/features/home/presentation/store/actions/crear_producto.actions.dart';
import 'package:servicio/features/home/presentation/store/actions/home.actions.dart';
import 'package:servicio/features/home/presentation/store/models/producto_state.dart';

final productosReducer = combineReducers<ProductoState>(
  [
      TypedReducer<ProductoState,LoadingActionHome >(_productoloading),
      TypedReducer<ProductoState,ProductoSuccessAction >(_productoSuccess),
      TypedReducer<ProductoState,ProductoFailedAction >(_productoFailed),
      TypedReducer<ProductoState,CrearProductoLoadingAction >(_crearProductoloading),
      TypedReducer<ProductoState,CrearProductoSuccessAction >(_crearProductoSuccess),
      TypedReducer<ProductoState,CrearProductoFailedAction >(_crearProductoFailed),
      TypedReducer<ProductoState, DesactivarProductoSuccessAction> (_desactivarProductoSuccess)
  ]
);


ProductoState _productoSuccess(ProductoState state, ProductoSuccessAction action){
  return state.copyWith(
    isLoading: false,
    loadingError: false,
    productos: action.data
  );
}

ProductoState _productoFailed(ProductoState state, ProductoFailedAction action){
  return state.copyWith(
    isLoading: false,
    loadingError: true,
    productos: null
  );
}

ProductoState _productoloading(ProductoState state, LoadingActionHome action){
  return state.copyWith(
    isLoading: true,
    loadingError: false,
    productos: null
  );
}

 ProductoState _crearProductoSuccess(ProductoState state, CrearProductoSuccessAction action){
  state.productos.add(action.data);
  return state.copyWith(
    isLoading: false,
    loadingError: false,
    productos: state.productos
  );
}

ProductoState _crearProductoFailed(ProductoState state, CrearProductoFailedAction action){
  return state.copyWith(
    isLoading: false,
    loadingError: true,
    productos: null
  );
}

ProductoState _crearProductoloading(ProductoState state, CrearProductoLoadingAction action){
  return state.copyWith(
    isLoading: true,
    loadingError: false,
    productos: null
  );
}

ProductoState _desactivarProductoSuccess(ProductoState state, DesactivarProductoSuccessAction action){
  state.productos.removeWhere((item) => item.productoId == action.data.productoId);
  return state.copyWith(
    isLoading: false,
    loadingError: false,
    productos: state.productos
  );
}