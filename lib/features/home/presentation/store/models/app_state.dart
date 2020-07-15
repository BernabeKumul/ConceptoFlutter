import 'package:meta/meta.dart';
import 'package:servicio/features/home/presentation/store/models/producto_state.dart';
import 'package:servicio/features/login/presentation/store/models/user_auth_state.dart';

@immutable
class AppState {
  final ProductoState productoState;
  final UserAuthState userState;

  AppState({
    @required this.productoState,
    @required this.userState
  });

  factory AppState.initial(){
    return AppState(productoState: ProductoState.initial(), userState: UserAuthState.initial());
  }

  AppState copyWith({ ProductoState productoState, UserAuthState userState}){
    return AppState(
      productoState: productoState ?? this.productoState,
      userState: userState ?? this.userState,
      );
  }

  // @override
  // int get hasCode => productoState.hashCode;

  // @override
  // bool operator ==(Object other) => 
  //    identical(this, other) ||
  //       other is AppState && productoState == other.productoState;
}