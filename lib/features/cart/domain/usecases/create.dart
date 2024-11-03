import '../../../../core/shared/shared.dart';
import '../../cart.dart';

class CreateCartUseCase {
  final CartRepository repository;

  CreateCartUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required CartEntity cart,
  }) async {
    return await repository.create(
      cart: cart,
    );
  }
}
