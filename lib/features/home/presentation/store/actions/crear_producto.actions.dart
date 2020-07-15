import 'package:servicio/features/home/data/models/producto_model.dart';

class CrearProductoLoadingAction{
  CrearProductoLoadingAction();
}

class CrearProductoSuccessAction{
  final ProductoModel data;

  CrearProductoSuccessAction(this.data);
}

class CrearProductoFailedAction{
  CrearProductoFailedAction();
}