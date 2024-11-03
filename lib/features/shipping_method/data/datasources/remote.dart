import '../../../../core/shared/shared.dart';
import '../../shipping_method.dart';

abstract class ShippingMethodRemoteDataSource {
  FutureOr<void> create({
    required ShippingMethodEntity shippingMethod,
  });

  FutureOr<void> delete({
    required int id,
  });

  FutureOr<ShippingMethodModel> find({
    required int id,
  });

  FutureOr<List<ShippingMethodModel>> read();

  FutureOr<List<ShippingMethodModel>> refresh();

  FutureOr<List<ShippingMethodModel>> search({
    required String query,
  });

  FutureOr<void> update({
    required ShippingMethodEntity shippingMethod,
  });
}
