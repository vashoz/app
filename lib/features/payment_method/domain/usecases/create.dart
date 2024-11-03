import '../../../../core/shared/shared.dart';
import '../../payment_method.dart';

class CreatePaymentMethodUseCase {
  final PaymentMethodRepository repository;

  CreatePaymentMethodUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required PaymentMethodEntity paymentMethod,
  }) async {
    return await repository.create(
      paymentMethod: paymentMethod,
    );
  }
}
