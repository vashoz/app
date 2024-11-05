part of '../config.dart';

Future<void> get favoriteDependencies async {
  //! ----------------- Bloc -----------------
  sl.registerLazySingleton(() => FavoriteBloc());
}
