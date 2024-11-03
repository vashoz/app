import '../../../../core/shared/shared.dart';
import '../../delivery_address.dart';

class ReadDeliveryAddressUseCase {
  final DeliveryAddressRepository repository;

  ReadDeliveryAddressUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<DeliveryAddressEntity>>> call() async {
    return await repository.read();
  }
}
