import '../../../../core/shared/shared.dart';
import '../../shipping_method.dart';

abstract class ShippingMethodLocalDataSource {
  FutureOr<void> add({
    required ShippingMethodEntity shippingMethod,
  });

  FutureOr<void> addAll({
    required List<ShippingMethodEntity> items,
  });

  FutureOr<void> update({
    required ShippingMethodEntity shippingMethod,
  });

  FutureOr<void> remove({
    required int id,
  });

  FutureOr<void> removeAll();

  FutureOr<ShippingMethodEntity> find({
    required int id,
  });
}
