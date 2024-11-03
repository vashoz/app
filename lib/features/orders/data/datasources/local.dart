import '../../../../core/shared/shared.dart';
import '../../orders.dart';

abstract class OrdersLocalDataSource {
  FutureOr<void> add({
    required TrackOrderEntity orders,
  });

  FutureOr<void> addAll({
    required List<TrackOrderEntity> items,
  });

  FutureOr<void> update({
    required TrackOrderEntity orders,
  });

  FutureOr<void> remove({
    required String orderId,
  });

  FutureOr<void> removeAll();

  FutureOr<TrackOrderEntity> find({
    required String orderId,
  });
}
