import '../../../../core/shared/shared.dart';
import '../../payment_method.dart';

class ReadPaymentMethodUseCase {
  final PaymentMethodRepository repository;

  ReadPaymentMethodUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<PaymentMethodEntity>>> call() async {
    return await repository.read();
  }
}
