import '../../../../core/shared/shared.dart';
import '../../payment_method.dart';

class DeletePaymentMethodUseCase {
  final PaymentMethodRepository repository;

  DeletePaymentMethodUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required String guid,
  }) async {
    return await repository.delete(
      guid: guid,
    );
  }
}
