import '../../../../core/shared/shared.dart';
import '../../discount.dart';

class RefreshDiscountUseCase {
  final DiscountRepository repository;

  RefreshDiscountUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<DiscountEntity>>> call() async {
    return await repository.refresh();
  }
}
