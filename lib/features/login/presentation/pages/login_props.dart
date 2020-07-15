import 'package:redux/redux.dart';
import 'package:servicio/features/home/presentation/store/models/app_state.dart';
import 'package:servicio/features/login/domain/entities/user.dart';
import 'package:servicio/features/login/presentation/store/effects/user_auth_effects.dart';

class LoginProps {
  final Function(Usuario usuario, Function success, Function(String mensaje) mostrarError) login;
  final bool isLoading;

  LoginProps(
      {this.isLoading,
      this.login});
}

LoginProps mapToProps(Store<AppState> store) {
  return LoginProps(
    isLoading: store.state.userState.isLoading,
    login: (usuario, success, mostrarError)  {
      store.dispatch(fetchLoginAction(usuario, success, mostrarError));
    },
  );
}
