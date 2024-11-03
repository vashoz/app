import '../../../../core/shared/shared.dart';
import '../../dashboard.dart';

class DeleteDashboardUseCase {
  final DashboardRepository repository;

  DeleteDashboardUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required String guid,
  }) async {
    return await repository.delete(
      guid: guid,
    );
  }
}
