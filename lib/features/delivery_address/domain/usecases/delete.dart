import '../../../../core/shared/shared.dart';
import '../../delivery_address.dart';

class DeleteDeliveryAddressUseCase {
  final DeliveryAddressRepository repository;

  DeleteDeliveryAddressUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required String guid,
  }) async {
    return await repository.delete(
      guid: guid,
    );
  }
}
