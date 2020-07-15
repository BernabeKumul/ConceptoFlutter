import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:servicio/core/notification/pushNotificationService.dart';
import 'package:servicio/features/home/domain/usecases/recuperar_producto.dart';
import 'package:servicio/features/home/presentation/pages/codigo_barras.dart';
import 'package:servicio/features/home/presentation/pages/crear_producto.dart';
import 'package:servicio/features/home/presentation/pages/home_productos_tablet.dart';
import 'package:servicio/features/home/presentation/pages/home_tablet.dart';
import 'core/util/middleware_injector.dart';
import 'features/home/domain/usecases/crear_producto.dart';
import 'features/home/domain/usecases/desactivar_producto.dart';
import 'features/home/presentation/pages/crear_producto_page.dart';
import 'features/home/presentation/pages/home.dart';
import 'features/home/presentation/pages/leer_pdf.dart';
import 'features/home/presentation/store/comun/HomeDependency.dart';
import 'features/home/presentation/store/models/app_state.dart';
import 'features/home/presentation/store/reducers/app_reducers.dart';
import 'features/login/domain/usecases/login.dart';
import 'features/login/presentation/pages/login.dart';
import 'features/login/presentation/store/comun/LoginDependency.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  
  final middleWareHome = InjectedMiddleware<HomeDependency>(
      deps: HomeDependency(
    recuperarProducto: RecuperarProducto(di.sl()),
    crearProducto: CrearProducto(di.sl()),
    desactivarProducto: DesactivarProducto(di.sl()),
  ));

  final middleWareLogin = InjectedMiddleware<LoginDependency>(
      deps: LoginDependency(
    login: Login(di.sl()),
  ));

  final store = Store<AppState>(appReducer,
      initialState: AppState.initial(),
      middleware: [
        new LoggingMiddleware.printer(),
        middleWareHome.thunkMiddlewareInjector,
        middleWareLogin.thunkMiddlewareInjector
      ]);
  // final _push = new PushNotificationService().initialise();

  runApp(StoreProvider(store: store, child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Login2(),
          // '/': (context) => HomePage(),
          // '/': (context) => LeerPDFPage(),
          // '/': (context) => CodigoBarraPage(),
          '/ProductoTablet': (context) => HomeProductosTabletPage(),
          '/homeTablet': (context) => HomeTabletPage(),
          '/crearProducto': (context) => CrearProdoductoPage(),
        });
  }
}
