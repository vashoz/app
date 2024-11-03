import '../../../../core/shared/shared.dart';
import '../../shipping_method.dart';

class DeleteShippingMethodUseCase {
  final ShippingMethodRepository repository;

  DeleteShippingMethodUseCase({
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
