import '../../../../core/shared/shared.dart';
import '../../payment_method.dart';

class FindPaymentMethodUseCase {
  final PaymentMethodRepository repository;

  FindPaymentMethodUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, PaymentMethodEntity>> call({
    required String guid,
  }) async {
    return await repository.find(
      guid: guid,
    );
  }
}
