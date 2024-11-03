import '../../../../core/shared/shared.dart';
import '../../payment_method.dart';

abstract class PaymentMethodRemoteDataSource {
  FutureOr<void> create({
    required PaymentMethodEntity paymentMethod,
  });

  FutureOr<void> delete({
    required String guid,
  });

  FutureOr<PaymentMethodModel> find({
    required String guid,
  });

  FutureOr<List<PaymentMethodModel>> read();

  FutureOr<List<PaymentMethodModel>> refresh();

  FutureOr<List<PaymentMethodModel>> search({
    required String query,
  });

  FutureOr<void> update({
    required PaymentMethodEntity paymentMethod,
  });
}
