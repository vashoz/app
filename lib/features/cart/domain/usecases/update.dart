import '../../../../core/shared/shared.dart';
import '../../cart.dart';

class UpdateCartUseCase {
  final CartRepository repository;

  UpdateCartUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required CartEntity cart,
  }) async {
    return await repository.update(
      cart: cart,
    );
  }
}
