import '../../../../core/shared/shared.dart';
import '../../cart.dart';

class ReadCartUseCase {
  final CartRepository repository;

  ReadCartUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<CartEntity>>> call() async {
    return await repository.read();
  }
}
