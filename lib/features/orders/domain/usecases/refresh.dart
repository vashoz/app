import '../../../../core/shared/shared.dart';
import '../../orders.dart';

class RefreshOrdersUseCase {
  final OrdersRepository repository;

  RefreshOrdersUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<TrackOrderEntity>>> call({
    required String guid,
  }) async {
    return await repository.refresh(
      guid: guid,
    );
  }
}
