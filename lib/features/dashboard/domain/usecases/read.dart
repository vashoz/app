import '../../../../core/shared/shared.dart';
import '../../dashboard.dart';

class ReadDashboardUseCase {
  final DashboardRepository repository;

  ReadDashboardUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, DashboardEntityPaginatedResponse>> call({
    required int page,
    required int limit,
  }) async {
    return await repository.read(
      page: page,
      limit: limit,
    );
  }
}
