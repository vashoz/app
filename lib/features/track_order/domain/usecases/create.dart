import '../../../../core/shared/shared.dart';
import '../../track_order.dart';

class CreateTrackOrderUseCase {
  final TrackOrderRepository repository;

  CreateTrackOrderUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required TrackOrderEntity trackOrder,
  }) async {
    return await repository.create(
      trackOrder: trackOrder,
    );
  }
}
