import '../../../../core/shared/shared.dart';
import '../../delivery_address.dart';

class SearchDeliveryAddressUseCase {
  final DeliveryAddressRepository repository;

  SearchDeliveryAddressUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<DeliveryAddressEntity>>> call({
    required String query,
  }) async {
    return await repository.search(
      query: query,
    );
  }
}
