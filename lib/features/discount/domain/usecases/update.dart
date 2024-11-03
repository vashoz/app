import '../../../../core/shared/shared.dart';
import '../../discount.dart';

class UpdateDiscountUseCase {
  final DiscountRepository repository;

  UpdateDiscountUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required DiscountEntity discount,
  }) async {
    return await repository.update(
      discount: discount,
    );
  }
}
