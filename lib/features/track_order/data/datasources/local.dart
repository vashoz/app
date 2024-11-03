import '../../../../core/shared/shared.dart';
import '../../track_order.dart';

abstract class TrackOrderLocalDataSource {
  FutureOr<void> add({
    required TrackOrderEntity trackOrder,
  });

  FutureOr<void> addAll({
    required List<TrackOrderEntity> items,
  });

  FutureOr<void> update({
    required TrackOrderEntity trackOrder,
  });

  FutureOr<void> remove({
    required int id,
  });

  FutureOr<void> removeAll();

  FutureOr<TrackOrderEntity> find({
    required int id,
  });
}
