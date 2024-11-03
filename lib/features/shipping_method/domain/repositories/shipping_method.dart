import '../../../../core/shared/shared.dart';
import '../../shipping_method.dart';

typedef ShippingMethodEntityPaginatedResponse = ({
  List<ShippingMethodEntity> items,
  int total,
});

abstract class ShippingMethodRepository {
  FutureOr<Either<Failure, void>> create({
    required ShippingMethodEntity shippingMethod,
  });

  FutureOr<Either<Failure, void>> delete({
    required int id,
  });

  FutureOr<Either<Failure, ShippingMethodEntity>> find({
    required int id,
  });

  FutureOr<Either<Failure, List<ShippingMethodEntity>>> read();

  FutureOr<Either<Failure, List<ShippingMethodEntity>>> refresh();

  FutureOr<Either<Failure, List<ShippingMethodEntity>>> search({
    required String query,
  });

  FutureOr<Either<Failure, void>> update({
    required ShippingMethodEntity shippingMethod,
  });
}
