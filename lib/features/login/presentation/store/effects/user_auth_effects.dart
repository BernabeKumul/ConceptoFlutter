import 'package:servicio/core/util/middleware_injector.dart';
import 'package:servicio/features/home/presentation/store/models/app_state.dart';
import 'package:servicio/features/login/domain/entities/user.dart';
import 'package:servicio/features/login/presentation/store/actions/user_auth_action.dart';
import 'package:servicio/features/login/presentation/store/comun/LoginDependency.dart';

ThunkInjectedAction<LoginDependency, AppState> fetchLoginAction(Usuario usuario, Function success, Function(String mensaje) mostrarError) {
  return (deps) => (store) {
        store.dispatch(new LoginLoadingAction());
        deps.login.call(usuario).then((user) {
          store.dispatch(LoginSuccessAction(user));
          success();
        }).catchError((error) {
          store.dispatch(LoginFailedAction());
          mostrarError(
            "Usuario o contraseña incorrecta"
          );
        });
      };
}