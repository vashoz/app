import '../../../../core/shared/shared.dart';
import '../../track_order.dart';

class RefreshTrackOrderUseCase {
  final TrackOrderRepository repository;

  RefreshTrackOrderUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<TrackOrderEntity>>> call() async {
    return await repository.refresh();
  }
}
