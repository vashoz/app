import '../../../../core/shared/shared.dart';
import '../../checkout.dart';

class DeleteCheckoutUseCase {
  final CheckoutRepository repository;

  DeleteCheckoutUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required int id,
  }) async {
    return await repository.delete(
      id: id,
    );
  }
}
