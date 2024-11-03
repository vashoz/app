import '../../../../core/shared/shared.dart';
import '../../payment_method.dart';

class UpdatePaymentMethodUseCase {
  final PaymentMethodRepository repository;

  UpdatePaymentMethodUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required PaymentMethodEntity paymentMethod,
  }) async {
    return await repository.update(
      paymentMethod: paymentMethod,
    );
  }
}
