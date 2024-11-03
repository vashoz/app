import '../../../../core/shared/shared.dart';
import '../../delivery_address.dart';

class DeliveryAddressRemoteDataSourceImpl
    extends DeliveryAddressRemoteDataSource {
  final Client client;

  DeliveryAddressRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<void> create({
    required DeliveryAddressEntity deliveryAddress,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> delete({
    required String guid,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<DeliveryAddressModel> find({
    required String guid,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<DeliveryAddressModel>> read() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<DeliveryAddressModel>> refresh() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<DeliveryAddressModel>> search({
    required String query,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> update({
    required DeliveryAddressEntity deliveryAddress,
  }) async {
    throw UnimplementedError();
  }
}
