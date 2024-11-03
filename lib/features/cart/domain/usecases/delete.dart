import '../../../../core/shared/shared.dart';
import '../../cart.dart';

class DeleteCartUseCase {
  final CartRepository repository;

  DeleteCartUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required int id,
  }) async {
    return await repository.delete(
      id: id,
    );
  }
}
