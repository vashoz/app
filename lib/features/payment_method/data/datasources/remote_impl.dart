import '../../../../core/shared/shared.dart';
import '../../payment_method.dart';

class PaymentMethodRemoteDataSourceImpl extends PaymentMethodRemoteDataSource {
  final Client client;

  PaymentMethodRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<void> create({
    required PaymentMethodEntity paymentMethod,
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
  FutureOr<PaymentMethodModel> find({
    required String guid,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<PaymentMethodModel>> read() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<PaymentMethodModel>> refresh() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<PaymentMethodModel>> search({
    required String query,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> update({
    required PaymentMethodEntity paymentMethod,
  }) async {
    throw UnimplementedError();
  }
}
