import '../../../../core/shared/shared.dart';
import '../../shipping_method.dart';

class CreateShippingMethodUseCase {
  final ShippingMethodRepository repository;

  CreateShippingMethodUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required ShippingMethodEntity shippingMethod,
  }) async {
    return await repository.create(
      shippingMethod: shippingMethod,
    );
  }
}
