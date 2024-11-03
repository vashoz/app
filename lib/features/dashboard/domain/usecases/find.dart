import '../../../../core/shared/shared.dart';
import '../../dashboard.dart';

class FindDashboardUseCase {
  final DashboardRepository repository;

  FindDashboardUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, DashboardEntity>> call({
    required String guid,
  }) async {
    return await repository.find(
      guid: guid,
    );
  }
}
