import '../../../features/cart/cart.dart';
import '../../../features/products/presentation/bloc/product_cart_bloc.dart';
import '../config.dart';

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
