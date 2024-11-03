import '../../../../core/shared/shared.dart';
import '../../cart.dart';

class FindCartUseCase {
  final CartRepository repository;

  FindCartUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, CartEntity>> call({
    required int id,
  }) async {
    return await repository.find(
      id: id,
    );
  }
}
