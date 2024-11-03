import '../../../../core/shared/shared.dart';
import '../../discount.dart';

class CreateDiscountUseCase {
  final DiscountRepository repository;

  CreateDiscountUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required DiscountEntity discount,
  }) async {
    return await repository.create(
      discount: discount,
    );
  }
}
