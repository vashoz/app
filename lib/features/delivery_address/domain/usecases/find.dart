import '../../../../core/shared/shared.dart';
import '../../delivery_address.dart';

class FindDeliveryAddressUseCase {
  final DeliveryAddressRepository repository;

  FindDeliveryAddressUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, DeliveryAddressEntity>> call({
    required String guid,
  }) async {
    return await repository.find(
      guid: guid,
    );
  }
}
