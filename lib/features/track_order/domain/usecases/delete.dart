import '../../../../core/shared/shared.dart';
import '../../track_order.dart';

class DeleteTrackOrderUseCase {
  final TrackOrderRepository repository;

  DeleteTrackOrderUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required int id,
  }) async {
    return await repository.delete(
      id: id,
    );
  }
}
