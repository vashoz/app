import '../../../../core/shared/shared.dart';
import '../../payment_method.dart';

class PaymentMethodLocalDataSourceImpl extends PaymentMethodLocalDataSource {
  final Map<String, PaymentMethodEntity> _cache = {};

  @override
  FutureOr<void> add({
    required PaymentMethodEntity paymentMethod,
  }) {
    _cache[paymentMethod.guid] = paymentMethod;
  }

  @override
  FutureOr<void> addAll({
    required List<PaymentMethodEntity> items,
  }) {
    for (final item in items) {
      _cache[item.guid] = item;
    }
  }

  @override
  FutureOr<void> update({
    required PaymentMethodEntity paymentMethod,
  }) {
    _cache[paymentMethod.guid] = paymentMethod;
  }

  @override
  FutureOr<void> remove({
    required String guid,
  }) {
    _cache.remove(guid);
  }

  @override
  FutureOr<void> removeAll() {
    _cache.clear();
  }

  @override
  FutureOr<PaymentMethodEntity> find({
    required String guid,
  }) {
    final item = _cache[guid];
    if (item == null) {
      throw PaymentMethodNotFoundInLocalCacheFailure();
    }
    return item;
  }
}
