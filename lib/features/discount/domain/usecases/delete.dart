import '../../../../core/shared/shared.dart';
import '../../discount.dart';

class DeleteDiscountUseCase {
  final DiscountRepository repository;

  DeleteDiscountUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required String guid,
  }) async {
    return await repository.delete(
      guid: guid,
    );
  }
}
