import '../../../../core/shared/shared.dart';
import '../../checkout.dart';

class RefreshCheckoutUseCase {
  final CheckoutRepository repository;

  RefreshCheckoutUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, CheckoutEntityPaginatedResponse>> call({
    required int page,
    required int limit,
  }) async {
    return await repository.refresh(
      page: page,
      limit: limit,
    );
  }
}
