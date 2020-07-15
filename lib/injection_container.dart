import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:servicio/features/login/domain/usecases/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'core/network/network_info.dart';
import 'core/notification/pushNotificationService.dart';
import 'features/home/data/datasources/productos_remote_data_Source.dart';
import 'features/home/data/repositories/producto_repository_repository_imple.dart';
import 'features/home/domain/repositories/producto_repository.dart';
import 'features/home/domain/usecases/recuperar_producto.dart';
import 'features/login/data/datasource/user_auth_remote_data_source.dart';
import 'features/login/data/repositories/user_auth_repository_imple.dart';
import 'features/login/domain/repositories/user_auth_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Use cases
  sl.registerLazySingleton(() => RecuperarProducto(sl()));
  sl.registerLazySingleton(() => Login(sl()));

  // sl.registerLazySingleton(() => PushNotificationService());
  
  //Repository
  sl.registerLazySingleton<ProductoRepository>(
    () => ProductoRepositoryImple(
      remoteDataSource: sl(),
      networkInfo: sl())
  );

  sl.registerLazySingleton<UserRepository>(
    () => UserAuthRepositoryImple(
      remoteDataSource: sl(),
      networkInfo: sl())
  );

  //Data Source
  sl.registerLazySingleton<ProductoRemoteDataSource>(
    () => ProductoRemoteDataSourceImple(
      client: sl(),
      sharedPreferences: sl()
    )
  );

  sl.registerLazySingleton<UserAuthRemoteDataSource>(
    () => UserAuthRemoteDataSourceImple(
      client: sl(),
      sharedPreferences: sl()
    )
  );

  //Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //External 
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}