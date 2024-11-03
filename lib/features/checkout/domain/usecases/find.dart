import '../../../../core/shared/shared.dart';
import '../../checkout.dart';

class FindCheckoutUseCase {
  final CheckoutRepository repository;

  FindCheckoutUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, CheckoutEntity>> call({
    required int id,
  }) async {
    return await repository.find(
      id: id,
    );
  }
}
