import '../../../../core/shared/shared.dart';
import '../../delivery_address.dart';

class UpdateDeliveryAddressUseCase {
  final DeliveryAddressRepository repository;

  UpdateDeliveryAddressUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required DeliveryAddressEntity deliveryAddress,
  }) async {
    return await repository.update(
      deliveryAddress: deliveryAddress,
    );
  }
}
