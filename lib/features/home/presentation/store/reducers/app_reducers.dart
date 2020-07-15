import 'package:servicio/features/home/presentation/store/models/app_state.dart';
import 'package:servicio/features/login/presentation/store/reducers/user_auth_reducers.dart';
import 'home.reducers.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    productoState: productosReducer(state.productoState, action),
    userState: authReducer(state.userState, action)
  );
}