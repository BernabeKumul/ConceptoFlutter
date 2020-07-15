import 'package:redux/redux.dart';
import 'package:servicio/features/login/presentation/store/actions/user_auth_action.dart';
import 'package:servicio/features/login/presentation/store/models/user_auth_state.dart';

final authReducer = combineReducers<UserAuthState>(
  [
      TypedReducer<UserAuthState,LoginSuccessAction >(_productoSuccess),
      TypedReducer<UserAuthState,LoginFailedAction >(_productoFailed),
      TypedReducer<UserAuthState, LoginLoadingAction> (_productoloading)
  ]
);


UserAuthState _productoSuccess(UserAuthState state, LoginSuccessAction action){
  return state.copyWith(
    isLoading: false,
    loadingError: false,
    user: action.data
  );
}

UserAuthState _productoFailed(UserAuthState state, LoginFailedAction action){
  return state.copyWith(
    isLoading: false,
    loadingError: true,
    user: null
  );
}

UserAuthState _productoloading(UserAuthState state, LoginLoadingAction action){
  return state.copyWith(
    isLoading: true,
    loadingError: false,
    user: null
  );
}