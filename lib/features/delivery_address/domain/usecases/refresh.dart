import '../../../../core/shared/shared.dart';
import '../../delivery_address.dart';

class RefreshDeliveryAddressUseCase {
  final DeliveryAddressRepository repository;

  RefreshDeliveryAddressUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<DeliveryAddressEntity>>> call() async {
    return await repository.refresh();
  }
}
