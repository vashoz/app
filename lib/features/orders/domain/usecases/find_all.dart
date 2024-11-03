import '../../../../core/shared/shared.dart';
import '../../orders.dart';

class FindAllOrdersUseCase {
  final OrdersRepository repository;

  FindAllOrdersUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<TrackOrderEntity>>> call({
    required String guid,
  }) async {
    return await repository.findAll(guid: guid);
  }
}
