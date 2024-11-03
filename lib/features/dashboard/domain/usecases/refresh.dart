import '../../../../core/shared/shared.dart';
import '../../dashboard.dart';

class RefreshDashboardUseCase {
  final DashboardRepository repository;

  RefreshDashboardUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, DashboardEntityPaginatedResponse>> call({
    required int page,
    required int limit,
  }) async {
    return await repository.refresh(
      page: page,
      limit: limit,
    );
  }
}
