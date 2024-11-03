import '../../../../core/shared/shared.dart';
import '../../track_order.dart';

class ReadTrackOrderUseCase {
  final TrackOrderRepository repository;

  ReadTrackOrderUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, TrackOrderEntity>> call({
    required String orderId,
    required String email,
  }) async {
    return await repository.read(
      orderId: orderId,
      email: email,
    );
  }
}
