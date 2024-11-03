import '../../../../core/shared/shared.dart';
import '../../orders.dart';

abstract class OrdersRepository {
  FutureOr<Either<Failure, List<TrackOrderEntity>>> findAll({
    required String guid,
  });

  FutureOr<Either<Failure, List<TrackOrderEntity>>> refresh({
    required String guid,
  });
}
