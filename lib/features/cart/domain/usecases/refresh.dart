import '../../../../core/shared/shared.dart';
import '../../cart.dart';

class RefreshCartUseCase {
  final CartRepository repository;

  RefreshCartUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<CartEntity>>> call() async {
    return await repository.refresh();
  }
}
