import '../../../../core/shared/shared.dart';
import '../../dashboard.dart';

class SearchDashboardUseCase {
  final DashboardRepository repository;

  SearchDashboardUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, DashboardEntityPaginatedResponse>> call({
    required int page,
    required int limit,
    required String query,
  }) async {
    return await repository.search(
      page: page,
      limit: limit,
      query: query,
    );
  }
}
