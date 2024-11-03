import '../../../../core/shared/shared.dart';
import '../../discount.dart';

class FindDiscountUseCase {
  final DiscountRepository repository;

  FindDiscountUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, DiscountEntity>> call({
    required String guid,
  }) async {
    return await repository.find(
      guid: guid,
    );
  }
}
