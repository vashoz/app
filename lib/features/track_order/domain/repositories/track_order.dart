import '../../../../core/shared/shared.dart';
import '../../track_order.dart';

typedef TrackOrderEntityPaginatedResponse = ({
  List<TrackOrderEntity> items,
  int total,
});

abstract class TrackOrderRepository {
  FutureOr<Either<Failure, void>> create({
    required TrackOrderEntity trackOrder,
  });

  FutureOr<Either<Failure, void>> delete({
    required int id,
  });

  FutureOr<Either<Failure, TrackOrderEntity>> find({
    required int id,
  });

  FutureOr<Either<Failure, TrackOrderEntity>> read({
    required String orderId,
    required String email,
  });

  FutureOr<Either<Failure, List<TrackOrderEntity>>> refresh();

  FutureOr<Either<Failure, List<TrackOrderEntity>>> search({
    required String query,
  });

  FutureOr<Either<Failure, void>> update({
    required TrackOrderEntity trackOrder,
  });
}
