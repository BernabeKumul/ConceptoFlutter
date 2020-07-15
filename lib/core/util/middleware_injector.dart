import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';


class InjectedMiddleware<Deps> {

  final Deps deps;

  const InjectedMiddleware({this.deps});

  void thunkMiddlewareInjector<State>(
      Store<State> store,
      dynamic action,
      NextDispatcher next,
      ) {
    if (action is ThunkInjectedAction<Deps, State>) {
      action(deps)(store);
    } else {
      next(action);
    }
  }
}

typedef ThunkAction<State> ThunkInjectedAction<Deps, State>(Deps deps);
