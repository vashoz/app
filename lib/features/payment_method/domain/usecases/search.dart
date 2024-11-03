import '../../../../core/shared/shared.dart';
import '../../payment_method.dart';

class SearchPaymentMethodUseCase {
  final PaymentMethodRepository repository;

  SearchPaymentMethodUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<PaymentMethodEntity>>> call({
    required String query,
  }) async {
    return await repository.search(
      query: query,
    );
  }
}
