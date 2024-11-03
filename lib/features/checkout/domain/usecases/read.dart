import '../../../../core/shared/shared.dart';
import '../../checkout.dart';

class ReadCheckoutUseCase {
  final CheckoutRepository repository;

  ReadCheckoutUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, CheckoutEntityPaginatedResponse>> call({
    required int page,
    required int limit,
  }) async {
    return await repository.read(
      page: page,
      limit: limit,
    );
  }
}
