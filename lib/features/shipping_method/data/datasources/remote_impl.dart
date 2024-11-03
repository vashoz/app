import '../../../../core/shared/shared.dart';
import '../../shipping_method.dart';

class ShippingMethodRemoteDataSourceImpl
    extends ShippingMethodRemoteDataSource {
  final Client client;

  ShippingMethodRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<void> create({
    required ShippingMethodEntity shippingMethod,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> delete({
    required int id,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<ShippingMethodModel> find({
    required int id,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<ShippingMethodModel>> read() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<ShippingMethodModel>> refresh() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<ShippingMethodModel>> search({
    required String query,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> update({
    required ShippingMethodEntity shippingMethod,
  }) async {
    throw UnimplementedError();
  }
}
