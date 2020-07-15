import 'package:meta/meta.dart';
import 'package:servicio/features/login/data/models/auth.dart';

@immutable
class UserAuthState {
  final bool isLoading;
  final bool loadingError;
  final AuthModel user;

  UserAuthState(
      {@required this.isLoading,
      @required this.loadingError,
      @required this.user});

  factory UserAuthState.initial() {
    return new UserAuthState(
        isLoading: false, loadingError: false, user: new AuthModel());
  }

  UserAuthState copyWith(
      {bool isLoading, bool loadingError, AuthModel user}) {
    return new UserAuthState(
        isLoading: isLoading ?? this.isLoading,
        loadingError: loadingError ?? this.loadingError,
        user: user ?? this.user);
  }

  @override
  int get hasCode => isLoading.hashCode ^ user.hashCode;
}
