import '../../../../core/shared/shared.dart';
import '../../dashboard.dart';

class CreateDashboardUseCase {
  final DashboardRepository repository;

  CreateDashboardUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required DashboardEntity dashboard,
  }) async {
    return await repository.create(
      dashboard: dashboard,
    );
  }
}
