part of '../config.dart';

Future<void> get forgotPasswordDependencies async {
  //! ----------------- Bloc -----------------

  //! ----------------- UseCase -----------------

  //! ----------------- Repository -----------------
  sl.registerLazySingleton<ForgotPasswordRepository>(
    () => ForgotPasswordRepositoryImpl(
      network: sl(),
      remote: sl(),
    ),
  );

  //! ----------------- Data sources -----------------
  sl.registerLazySingleton<ForgotPasswordRemoteDataSource>(
    () => ForgotPasswordRemoteDataSourceImpl(
      client: sl(),
    ),
  );
}
