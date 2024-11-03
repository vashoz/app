import '../../../../core/shared/shared.dart';
import '../../checkout.dart';

class CheckoutRemoteDataSourceImpl extends CheckoutRemoteDataSource {
  final Client client;

  CheckoutRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<void> create({
    required CheckoutEntity checkout,
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
  FutureOr<CheckoutModel> find({
    required int id,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<CheckoutModelPaginatedResponse> read({
    required int page,
    required int limit,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<CheckoutModelPaginatedResponse> refresh({
    required int page,
    required int limit,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<CheckoutModelPaginatedResponse> search({
    required int page,
    required int limit,
    required String query,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> update({
    required CheckoutEntity checkout,
  }) async {
    throw UnimplementedError();
  }
}
