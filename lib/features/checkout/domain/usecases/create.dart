import '../../../../core/shared/shared.dart';
import '../../checkout.dart';

class CreateCheckoutUseCase {
  final CheckoutRepository repository;

  CreateCheckoutUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required CheckoutEntity checkout,
  }) async {
    return await repository.create(
      checkout: checkout,
    );
  }
}
