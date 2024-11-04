part of '../config.dart';

Future<void> get cartDependencies async {
  //! ----------------- Bloc -----------------
  sl.registerFactory(
    () => CartBloc(),
  );
  sl.registerFactory(
    () => ProductCartBloc(),
  );

  //! ----------------- UseCase -----------------
}
