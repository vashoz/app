import '../../../../core/shared/shared.dart';
import '../../track_order.dart';

abstract class TrackOrderRemoteDataSource {
  FutureOr<void> create({
    required TrackOrderEntity trackOrder,
  });

  FutureOr<void> delete({
    required int id,
  });

  FutureOr<TrackOrderModel> find({
    required int id,
  });

  FutureOr<TrackOrderModel> read({
    required String orderId,
    required String email,
  });

  FutureOr<List<TrackOrderModel>> refresh();

  FutureOr<List<TrackOrderModel>> search({
    required String query,
  });

  FutureOr<void> update({
    required TrackOrderEntity trackOrder,
  });
}
