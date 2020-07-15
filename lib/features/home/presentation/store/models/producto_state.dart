import 'package:meta/meta.dart';
import 'package:servicio/features/home/data/models/producto_model.dart';

@immutable
class ProductoState{
  final bool isLoading;
  final bool loadingError;
  final List<ProductoModel> productos;

  ProductoState({
    @required this.isLoading,
    @required this.loadingError,
    @required this.productos
  });

  factory ProductoState.initial(){
    return new ProductoState(isLoading: false, loadingError: false, productos: new List<ProductoModel>());
  }

  ProductoState copyWith({
    bool isLoading, 
    bool loadingError,
    List<ProductoModel> productos
  }){
   return new ProductoState(
     isLoading: isLoading ?? this.isLoading,
     loadingError: loadingError ?? this.loadingError,
      productos: productos ?? this.productos);
  }

  @override
  int get hasCode => isLoading.hashCode ^ productos.hashCode;
}