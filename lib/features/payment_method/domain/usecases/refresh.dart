import '../../../../core/shared/shared.dart';
import '../../payment_method.dart';

class RefreshPaymentMethodUseCase {
  final PaymentMethodRepository repository;

  RefreshPaymentMethodUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<PaymentMethodEntity>>> call() async {
    return await repository.refresh();
  }
}
