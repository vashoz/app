import '../../../../core/shared/shared.dart';
import '../../delivery_address.dart';

typedef DeliveryAddressEntityPaginatedResponse = ({
  List<DeliveryAddressEntity> items,
  int total,
});

abstract class DeliveryAddressRepository {
  FutureOr<Either<Failure, void>> create({
    required DeliveryAddressEntity deliveryAddress,
  });

  FutureOr<Either<Failure, void>> delete({
    required String guid,
  });

  FutureOr<Either<Failure, DeliveryAddressEntity>> find({
    required String guid,
  });

  FutureOr<Either<Failure, List<DeliveryAddressEntity>>> read();

  FutureOr<Either<Failure, List<DeliveryAddressEntity>>> refresh();

  FutureOr<Either<Failure, List<DeliveryAddressEntity>>> search({
    required String query,
  });

  FutureOr<Either<Failure, void>> update({
    required DeliveryAddressEntity deliveryAddress,
  });
}
