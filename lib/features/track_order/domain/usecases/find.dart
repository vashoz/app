import '../../../../core/shared/shared.dart';
import '../../track_order.dart';

class FindTrackOrderUseCase {
  final TrackOrderRepository repository;

  FindTrackOrderUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, TrackOrderEntity>> call({
    required int id,
  }) async {
    return await repository.find(
      id: id,
    );
  }
}
