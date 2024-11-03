import '../../../../core/shared/shared.dart';
import '../../shipping_method.dart';

class UpdateShippingMethodUseCase {
  final ShippingMethodRepository repository;

  UpdateShippingMethodUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required ShippingMethodEntity shippingMethod,
  }) async {
    return await repository.update(
      shippingMethod: shippingMethod,
    );
  }
}
