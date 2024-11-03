import '../../../../core/shared/shared.dart';
import '../../payment_method.dart';

abstract class PaymentMethodLocalDataSource {
  FutureOr<void> add({
    required PaymentMethodEntity paymentMethod,
  });

  FutureOr<void> addAll({
    required List<PaymentMethodEntity> items,
  });

  FutureOr<void> update({
    required PaymentMethodEntity paymentMethod,
  });

  FutureOr<void> remove({
    required String guid,
  });

  FutureOr<void> removeAll();

  FutureOr<PaymentMethodEntity> find({
    required String guid,
  });
}
