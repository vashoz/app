import '../../../../core/shared/shared.dart';
import '../../delivery_address.dart';

class CreateDeliveryAddressUseCase {
  final DeliveryAddressRepository repository;

  CreateDeliveryAddressUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required DeliveryAddressEntity deliveryAddress,
  }) async {
    return await repository.create(
      deliveryAddress: deliveryAddress,
    );
  }
}
