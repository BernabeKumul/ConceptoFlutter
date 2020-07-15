import 'package:servicio/features/home/data/models/producto_model.dart';

class LoadingActionHome{
  LoadingActionHome();
}

class ProductoSuccessAction{
  final List<ProductoModel> data;

  ProductoSuccessAction(this.data);
}

class ProductoFailedAction{
  ProductoFailedAction();
}

class DesactivarProductoSuccessAction{
  final ProductoModel data;

  DesactivarProductoSuccessAction(this.data);
}