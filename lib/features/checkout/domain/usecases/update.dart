import '../../../../core/shared/shared.dart';
import '../../checkout.dart';

class UpdateCheckoutUseCase {
  final CheckoutRepository repository;

  UpdateCheckoutUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required CheckoutEntity checkout,
  }) async {
    return await repository.update(
      checkout: checkout,
    );
  }
}
