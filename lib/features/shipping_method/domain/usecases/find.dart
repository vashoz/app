import '../../../../core/shared/shared.dart';
import '../../shipping_method.dart';

class FindShippingMethodUseCase {
  final ShippingMethodRepository repository;

  FindShippingMethodUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, ShippingMethodEntity>> call({
    required int id,
  }) async {
    return await repository.find(
      id: id,
    );
  }
}
