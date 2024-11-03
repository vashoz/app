import '../../../../core/shared/shared.dart';
import '../../track_order.dart';

class UpdateTrackOrderUseCase {
  final TrackOrderRepository repository;

  UpdateTrackOrderUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required TrackOrderEntity trackOrder,
  }) async {
    return await repository.update(
      trackOrder: trackOrder,
    );
  }
}
