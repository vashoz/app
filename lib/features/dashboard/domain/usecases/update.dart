import '../../../../core/shared/shared.dart';
import '../../dashboard.dart';

class UpdateDashboardUseCase {
  final DashboardRepository repository;

  UpdateDashboardUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required DashboardEntity dashboard,
  }) async {
    return await repository.update(
      dashboard: dashboard,
    );
  }
}
