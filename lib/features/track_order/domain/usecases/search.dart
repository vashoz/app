import '../../../../core/shared/shared.dart';
import '../../track_order.dart';

class SearchTrackOrderUseCase {
  final TrackOrderRepository repository;

  SearchTrackOrderUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<TrackOrderEntity>>> call({
    required String query,
  }) async {
    return await repository.search(
      query: query,
    );
  }
}
