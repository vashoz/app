part of '../config.dart';

Future<void> get onBoardDependencies async {
  //! ----------------- Bloc -----------------
  sl.registerLazySingleton(
    () => OnboardBloc(),
  );
}
